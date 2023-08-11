locals {
  # Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)
  use_existing_route53_zone = true

  domain = "terraform-aws-modules.modules.tf"

  # Removing trailing dot from domain - just to be sure :)
  domain_name = trimsuffix(local.domain, ".")

  zone_id = try(data.aws_route53_zone.this[0].zone_id, aws_route53_zone.this[0].zone_id)
}

##########################################################
# Example 1 (default case):
# Using one AWS provider for both ACM and Route53 records
##########################################################

data "aws_route53_zone" "this" {
  count = local.use_existing_route53_zone ? 1 : 0

  name         = local.domain_name
  private_zone = false
}

resource "aws_route53_zone" "this" {
  count = !local.use_existing_route53_zone ? 1 : 0

  name = local.domain_name
}

module "acm" {
  source = "../../"

  providers = {
    aws.acm = aws,
    aws.dns = aws
  }

  domain_name = local.domain_name
  zone_id     = local.zone_id

  subject_alternative_names = [
    "*.alerts.${local.domain_name}",
    "new.sub.${local.domain_name}",
    "*.${local.domain_name}",
    "alerts.${local.domain_name}",
  ]

  validation_method = "DNS"

  tags = {
    Name = local.domain_name
  }
}

################################################################
# Example 2:
# Using separate AWS providers for ACM and Route53 records.
# Useful when these resources belong to different AWS accounts.
################################################################

provider "aws" {
  alias = "route53"
}

provider "aws" {
  alias = "acm"
}

module "acm_only" {
  source = "../../"

  providers = {
    aws = aws.acm
  }

  domain_name = local.domain_name
  subject_alternative_names = [
    "*.alerts.separated.${local.domain_name}",
    "new.sub.separated.${local.domain_name}",
    "*.separated.${local.domain_name}",
    "alerts.separated.${local.domain_name}",
  ]

  create_route53_records  = false
  validation_method       = "DNS"
  validation_record_fqdns = module.route53_records_only.validation_route53_record_fqdns
}

module "route53_records_only" {
  source = "../../"

  providers = {
    aws = aws.route53
  }

  create_certificate          = false
  create_route53_records_only = true
  validation_method           = "DNS"

  zone_id               = local.zone_id
  distinct_domain_names = module.acm_only.distinct_domain_names

  acm_certificate_domain_validation_options = module.acm_only.acm_certificate_domain_validation_options
}
