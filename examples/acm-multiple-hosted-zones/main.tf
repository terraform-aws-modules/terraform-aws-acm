# ---------------------------------------------------------------------------------------------------------------------
# Example (use multiple domains in the same certificate):
# Generate an ACM certificate for multiple domains, useful
# to be used in CloudFront which only supports one ACM
# certificate.
# ---------------------------------------------------------------------------------------------------------------------

# REF: https://github.com/terraform-aws-modules/terraform-aws-acm/pull/137

locals {
  zone_id = try(data.aws_route53_zone.this[0].zone_id, aws_route53_zone.this[0].zone_id)
}

provider "aws" {
  region = var.aws_region
}

# If you already have the hosted zones, they can be used to test this example.
# Just set the use_existing_route53_zone variable as true and configure the 
# domain_name and extra_domain variables with the correspond values.
data "aws_route53_zone" "this" {
  count = var.use_existing_route53_zone ? 1 : 0

  name         = var.domain_name
  private_zone = false
}

data "aws_route53_zone" "extra" {
  count = var.use_existing_route53_zone ? 1 : 0

  name         = var.extra_domain
  private_zone = false
}

# If you need to deploy also the hosted zones for test the example, then
# set the use_existing_route53_zone variable as false. This way, the example will 
# create both hosted zones, using the domain_name and extra_domain values.
resource "aws_route53_zone" "this" {
  count = !var.use_existing_route53_zone ? 1 : 0

  name = var.domain_name
}

resource "aws_route53_zone" "extra" {
  count = !var.use_existing_route53_zone ? 1 : 0

  name = var.extra_domain
}

module "acm_multi_domain" {
  source = "../../modules/acm/"

  domain_name = var.domain_name
  zone_id     = local.zone_id

  subject_alternative_names = [
    "*.alerts.${var.domain_name}",
    "new.sub.${var.domain_name}",
    "*.${var.domain_name}",
    "alerts.${var.domain_name}",
    "*.alerts.${var.extra_domain}",
    "new.sub.${var.extra_domain}",
    "*.${var.extra_domain}",
    "alerts.${var.extra_domain}",
    var.extra_domain,
    "*.${var.extra_domain}"
  ]

  # Each extra subdomain must be mapped to the correct zone id.
  # If not, the module creates the records using the zone_id variable (not the
  # extra domain zone id) and the validation will fail.
  zones = {
    (var.extra_domain)              = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id),
    "alerts.${local.extra_domain}"  = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id),
    "new.sub.${local.extra_domain}" = try(data.aws_route53_zone.extra[0].zone_id, aws_route53_zone.extra[0].zone_id)
  }
}