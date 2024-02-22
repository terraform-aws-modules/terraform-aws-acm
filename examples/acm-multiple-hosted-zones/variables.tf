variable "use_existing_route53_zone" {
  description = "Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "Domain to be used for the tests"
  type        = string
  default     = "terraform-aws-modules.modules.tf"
}

variable "extra_domain" {
  description = "Extr adomain to be used for the tests"
  type        = string
  default     = "extra.terraform-aws-modules.modules.tf"
}

variable "aws_region" {
  description = "The AWS Region where this VPC will exist."
  type        = string
  default     = "us-east-1"
}