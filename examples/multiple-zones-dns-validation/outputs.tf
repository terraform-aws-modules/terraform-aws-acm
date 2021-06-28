output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}

output "acm_certificate_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
  value       = module.acm.acm_certificate_domain_validation_options
}

output "acm_certificate_validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = module.acm.acm_certificate_validation_emails
}

output "validation_route53_record_fqdns" {
  description = "List of FQDNs built using the zone domain and name."
  value       = module.acm.validation_route53_record_fqdns
}

output "distinct_domain_names" {
  description = "List of distinct domains names used for the validation."
  value       = module.acm.distinct_domain_names
}

output "distinct_domain_names_without_matching_zone" {
  description = "List of distinct domains names that must be used for the validation but for which no Route 53 zone could be determined from the given input."
  value       = module.acm.distinct_domain_names_without_matching_zone
}

output "validation_domains" {
  description = "List of distinct domain validation options. This is useful if subject alternative names contain wildcards."
  value       = module.acm.validation_domains
}

output "validation_domains_without_matching_zone" {
  description = "List of distinct domain validation options for which validation records have not been created because no Route 53 zone could be determined from the given input."
  value       = module.acm.validation_domains_without_matching_zone
}
