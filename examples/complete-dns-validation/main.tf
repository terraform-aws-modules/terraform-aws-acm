locals {
  # Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)
  use_existing_route53_zone = var.use_existing_route53_zone

  domain       = var.domain
  extra_domain = var.extra_domain

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

###############################################################################
# Example 3:
# Single certificate with multiple domains from different Route53 hosted zones.
# Useful when using the certificate for CloudFront, which only support a
# single certificate per distribution.
###############################################################################

data "aws_route53_zone" "extra" {
  count = local.use_existing_route53_zone ? 1 : 0

  name         = local.extra_domain
  private_zone = false
}

resource "aws_route53_zone" "extra" {
  count = !local.use_existing_route53_zone ? 1 : 0

  name = local.extra_domain
}

module "acm_multi_domain" {
  source = "../../"

  domain_name = local.domain_name
  zone_id     = local.zone_id

  subject_alternative_names = [
    "*.alerts.${local.domain_name}",
    "new.sub.${local.domain_name}",
    local.extra_domain,
    "*.alerts.${local.extra_domain}",
    "new.sub.${local.extra_domain}",
  ]

  validation_method = "DNS"

  zones = {
    (local.extra_domain)            = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id),
    "alerts.${local.extra_domain}"  = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id),
    "new.sub.${local.extra_domain}" = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id)
  }
}
