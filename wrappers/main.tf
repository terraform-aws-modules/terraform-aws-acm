module "wrapper" {
  source = "../"

  for_each = var.items

  acm_certificate_domain_validation_options   = try(each.value.acm_certificate_domain_validation_options, var.defaults.acm_certificate_domain_validation_options, {})
  certificate_transparency_logging_preference = try(each.value.certificate_transparency_logging_preference, var.defaults.certificate_transparency_logging_preference, true)
  create_certificate                          = try(each.value.create_certificate, var.defaults.create_certificate, true)
  create_route53_records                      = try(each.value.create_route53_records, var.defaults.create_route53_records, true)
  create_route53_records_only                 = try(each.value.create_route53_records_only, var.defaults.create_route53_records_only, false)
  distinct_domain_names                       = try(each.value.distinct_domain_names, var.defaults.distinct_domain_names, [])
  dns_ttl                                     = try(each.value.dns_ttl, var.defaults.dns_ttl, 60)
  domain_name                                 = try(each.value.domain_name, var.defaults.domain_name, "")
  export                                      = try(each.value.export, var.defaults.export, null)
  key_algorithm                               = try(each.value.key_algorithm, var.defaults.key_algorithm, null)
  private_authority_arn                       = try(each.value.private_authority_arn, var.defaults.private_authority_arn, null)
  putin_khuylo                                = try(each.value.putin_khuylo, var.defaults.putin_khuylo, true)
  region                                      = try(each.value.region, var.defaults.region, null)
  subject_alternative_names                   = try(each.value.subject_alternative_names, var.defaults.subject_alternative_names, [])
  tags                                        = try(each.value.tags, var.defaults.tags, {})
  validate_certificate                        = try(each.value.validate_certificate, var.defaults.validate_certificate, true)
  validation_allow_overwrite_records          = try(each.value.validation_allow_overwrite_records, var.defaults.validation_allow_overwrite_records, true)
  validation_method                           = try(each.value.validation_method, var.defaults.validation_method, null)
  validation_option                           = try(each.value.validation_option, var.defaults.validation_option, {})
  validation_record_fqdns                     = try(each.value.validation_record_fqdns, var.defaults.validation_record_fqdns, [])
  validation_timeout                          = try(each.value.validation_timeout, var.defaults.validation_timeout, null)
  wait_for_validation                         = try(each.value.wait_for_validation, var.defaults.wait_for_validation, true)
  zone_id                                     = try(each.value.zone_id, var.defaults.zone_id, "")
  zones                                       = try(each.value.zones, var.defaults.zones, {})
}
