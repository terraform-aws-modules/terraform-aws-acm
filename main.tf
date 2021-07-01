locals {
  # Get distinct list of domains and SANs that can be mapped to a zone
  distinct_domain_names = distinct(
    [for s in concat([var.domain_name], var.subject_alternative_names) : replace(s, "*.", "")
      if length(var.domain_zones) == 0 || contains(keys(var.domain_zones), s)
    ]
  )

  # Get the list of distinct domain_validation_options, with wildcard
  # domain names replaced by the domain name. Validation records will be
  # created from this list.
  validation_domains = var.create_certificate ? distinct(
    [for k, v in aws_acm_certificate.this[0].domain_validation_options : tomap(merge(
       v, { domain_name = replace(v.domain_name, "*.", "") }
    )) if contains(local.distinct_domain_names, replace(v.domain_name, "*.", ""))]
  ) : []
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
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate ? length(local.distinct_domain_names) : 0

  zone_id = (
    length(var.domain_zones) == 0
      ? var.zone_id
      : var.domain_zones[element(local.validation_domains, count.index)["domain_name"]]["zone_id"]
  )
  name    = element(local.validation_domains, count.index)["resource_record_name"]
  type    = element(local.validation_domains, count.index)["resource_record_type"]
  ttl     = var.dns_ttl

  records = [
    element(local.validation_domains, count.index)["resource_record_value"]
  ]

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = aws_route53_record.validation.*.fqdn
}
