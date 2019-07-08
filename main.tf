locals {
  // Get distinct list of domains and SANs
  distinct_domain_names = distinct(concat([var.domain_name], data.template_file.breakup_san.*.rendered))

  // Copy domain_validation_options for the distinct domain names
  validation_domains = [for k, v in aws_acm_certificate.this[0].domain_validation_options : tomap(v) if contains(local.distinct_domain_names, v.domain_name)]
}

data "template_file" "breakup_san" {
  count = length(var.subject_alternative_names)

  template = replace(var.subject_alternative_names[count.index], "*.", "")
}

resource "aws_acm_certificate" "this" {
  count = var.create_certificate ? 1 : 0

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate ? length(local.distinct_domain_names) : 0

  zone_id = var.zone_id
  name    = element(local.validation_domains, count.index)["resource_record_name"]
  type    = element(local.validation_domains, count.index)["resource_record_type"]
  ttl     = 60

  records = [
    element(local.validation_domains, count.index)["resource_record_value"]
  ]

  allow_overwrite = var.validation_allow_overwrite_records
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = aws_route53_record.validation.*.fqdn
}
