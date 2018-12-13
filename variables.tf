variable "create_certificate" {
  description = "Whether to create ACM certificate"
  default     = true
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  default     = true
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  default     = true
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  default     = ""
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  default     = []
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  default     = "DNS"
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = "map"
  default     = {}
}
