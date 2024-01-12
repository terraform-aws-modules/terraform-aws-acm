# ---------------------------------------------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  # The AWS region in which all resources will be created
  region = var.aws_region
}

# ---------------------------------------------------------------------------------------------------------------------
# ACM
# ---------------------------------------------------------------------------------------------------------------------
module "acm" {
  source = "../../modules/acm/"

  create_certificate = var.create_certificate
  domain_name        = var.domain_name
  zone_id            = var.zone_id

  # For certificate in private zone, validation has to be by email.
  validation_method                  = var.validation_method
  validate_certificate               = var.validate_certificate
  validation_allow_overwrite_records = var.validation_allow_overwrite_records
  wait_for_validation                = var.wait_for_validation
  subject_alternative_names          = var.subject_alternative_names
  tags                               = var.tags
}