provider "aws" {
  region = "us-east-1"
  profile = "development"
}

# this is where hosted zone present/need to be created
provider "aws" {
  region = "us-east-1"
  alias  = "production"
  profile = "production"
}


locals {
  # Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)
  use_existing_route53_zone = false

  domain = "terraform-aws-modules.modules.tf"

  # Removing trailing dot from domain - just to be sure :)
  domain_name = trimsuffix(local.domain, ".")
}

data "aws_route53_zone" "this" {
  provider = aws.production

  count = local.use_existing_route53_zone ? 1 : 0

  name         = local.domain_name
  private_zone = false
}

resource "aws_route53_zone" "this" {
  provider = aws.production

  count = ! local.use_existing_route53_zone ? 1 : 0
  name  = local.domain_name
}

module "acm" {
  source = "../../"

  domain_name = local.domain_name
  zone_id     = coalescelist(data.aws_route53_zone.this.*.zone_id, aws_route53_zone.this.*.zone_id)[0]

  subject_alternative_names = [
    "dev.${local.domain_name}",
    "*.dev.${local.domain_name}",
  ]

  wait_for_validation = true

  tags = {
    Name = local.domain_name
  }

  providers = {
    aws = aws
    # hosted zone in production(another) account
    aws.route53 = aws.production
  }
}
