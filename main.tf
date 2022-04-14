locals {
  create_certificate = var.create_certificate && var.putin_khuylo

  # Normalize var.subject_alternative_names to a list of maps: [{name = NAME, zone_id = ZONE_ID}]
  ## var.subject_alternative_names is a list of mixed elements: Strings and Maps of Strings
  ## string elements use the string as the "name" and use var.zone_id as their "zone_id"
  ## map elements passthrough their "name" and "zone_id" values (if zone_id not specified use var.zone_id)
  subject_alternative_names = [
    for element in var.subject_alternative_names :
    {
      name    = try(tostring(element["name"]), tostring(element))
      zone_id = try(tostring(element["zone_id"]), var.zone_id)
    }
  ]

  # Create a map from domain name (minus wildcard) to zone id
  ## The extra flatten([]) is to resolve a bug in terraform 0.12.26 (keeping backwards compatibility)
  ## https://github.com/hashicorp/terraform/issues/22404
  domainname_to_zoneid = merge(flatten([[
    for element in concat([{ name = var.domain_name, zone_id = var.zone_id }], local.subject_alternative_names) :
    {
      replace(element.name, "*.", "") = element.zone_id
    }
  ]])...)

  # Get distinct list of domains and SANs
  distinct_domain_names = distinct([
    for s in concat([var.domain_name], local.subject_alternative_names[*].name) :
    replace(s, "*.", "")
  ])

  # Get the list of distinct domain_validation_options, with wildcard
  # domain names replaced by the domain name
  validation_domains = local.create_certificate ? distinct(
    [for k, v in aws_acm_certificate.this[0].domain_validation_options : merge(
      tomap(v), { domain_name = replace(v.domain_name, "*.", "") }
    )]
  ) : []
}

resource "aws_acm_certificate" "this" {
  count = local.create_certificate ? 1 : 0

  domain_name               = var.domain_name
  subject_alternative_names = local.subject_alternative_names[*].name
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
  count = local.create_certificate && var.validation_method == "DNS" && var.create_route53_records && var.validate_certificate ? length(local.distinct_domain_names) : 0

  zone_id = local.domainname_to_zoneid[element(local.validation_domains, count.index)["domain_name"]]
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
  count = local.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = flatten([aws_route53_record.validation.*.fqdn, var.validation_record_fqdns])
}
