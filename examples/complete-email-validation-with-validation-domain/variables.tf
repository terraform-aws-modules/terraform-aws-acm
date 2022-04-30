variable "domain_name" {
  description = "Domain name to use as Route53 zone and ACM certificate"
  type        = string
}

variable "validation_domain" {
  description = "Domain name to use for verifying var.domain_name"
  type        = string
}
