locals {
  # Get distinct list of domains and SANs
  distinct_domain_names = tolist(distinct(
    [for s in concat([var.domain_name], var.subject_alternative_names) : replace(s, "*.", "")]
  ))
  # The subset of distinct domain names which we can map to a hosted zone
  distinct_domain_names_with_matching_zone = (
    length(var.domain_zones) == 0
      ? local.distinct_domain_names
      : [for d in local.distinct_domain_names : d
           if 0 < length([for k in keys(var.domain_zones) : 1
                            if lower(d) == lower(k) || trimsuffix(lower(d), lower(format(".%s", k))) != lower(d)])
        ]
  )
  # Output: the subset of distinct domain names which we cannot map to a hosted zone
  distinct_domain_names_without_matching_zone = tolist([
    for d in local.distinct_domain_names : d
      if !contains(local.distinct_domain_names_with_matching_zone, d)
  ])

  # Get the list of distinct domain_validation_options, with wildcard
  # domain names replaced by the domain name
  validation_domains = tolist(
    var.create_certificate ? distinct(
      [for k, v in aws_acm_certificate.this[0].domain_validation_options : tomap(merge(
         v, { domain_name = replace(v.domain_name, "*.", "") }
      ))]
    ) : []
  )

  # The subset of the domain validation options from which we can create records
  validation_domains_with_matching_zone = var.create_certificate ? distinct(
    [for k, v in aws_acm_certificate.this[0].domain_validation_options :
      merge(v, { domain_name = replace(v.domain_name, "*.", "") })
        if contains(local.distinct_domain_names_with_matching_zone, replace(v.domain_name, "*.", ""))
    ]) : []
  # Output: the subset of the domain validation options for which we cannot create records
  validation_domains_without_matching_zone = tolist(distinct(
    var.create_certificate ? [
      for k, v in aws_acm_certificate.this[0].domain_validation_options :
        tomap(merge(v, { domain_name = replace(v.domain_name, "*.", "") }))
          if contains(local.distinct_domain_names_without_matching_zone, replace(v.domain_name, "*.", ""))
      ] : []
  ))

  # Prepare map for iterating over the keys of var.domain_zones in the order
  # of their length, from the longest one to the shortest one
  name_max_length = max(concat([0], [for n in keys(var.domain_zones) : length(n) ])...)
  name_format = "%0${local.name_max_length}d_%s"
  domains_by_name_length = {
    for n, v in var.domain_zones :
      format(local.name_format, length(n), n) => merge(v, { domain = n })
  }

  # For each item in validation_domains_with_matching_zone map to a zone_id from
  # var.domain_zones or, if var.domain_zones is empty, to var.zone_id.
  zone_ids = var.create_certificate ? [
    for vd in local.validation_domains_with_matching_zone : (
      length(var.domain_zones) == 0
        ? var.zone_id
        : element([for k in reverse(keys(local.domains_by_name_length)) :
                     local.domains_by_name_length[k].zone_id
                     # Is the FQDN a parent of the fully-qualified validation record name?
                     if trimsuffix(
                       lower(vd.resource_record_name),  # already FQDN
                       lower(".${local.domains_by_name_length[k].domain}.")
                     ) != lower(vd.resource_record_name)
                  ], 0)
    )
  ] : []
}

resource "aws_acm_certificate" "this" {
  count = var.create_certificate ? 1 : 0

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference ? "ENABLED" : "DISABLED"
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate ? length(local.distinct_domain_names_with_matching_zone) : 0

  zone_id = element(local.zone_ids, count.index)
  name    = element(local.validation_domains_with_matching_zone, count.index)["resource_record_name"]
  type    = element(local.validation_domains_with_matching_zone, count.index)["resource_record_type"]
  ttl     = var.dns_ttl

  records = [
    element(local.validation_domains_with_matching_zone, count.index)["resource_record_value"]
  ]

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = aws_route53_record.validation.*.fqdn
}
