locals {
  primary_domain = "terraform-aws-modules.modules.tf"
  extra_domain   = "terraform-aws-modules.extra-modules.tf"

  # Removing trailing dot from domain - just to be sure :)
  primary_domain_name = trimsuffix(local.primary_domain, ".")
  extra_domain_name   = trimsuffix(local.extra_domain, ".")
}

data "aws_route53_zone" "primary_domain" {
  name         = local.primary_domain_name
  private_zone = false
}

data "aws_route53_zone" "extra_domain" {
  name         = local.extra_domain_name
  private_zone = false
}


module "acm" {
  source = "../../"

  domain_name = local.primary_domain_name
  zone_id     = data.aws_route53_zone.primary_domain.zone_id

  subject_alternative_names = [
    "*.${local.primary_domain_name}",
    {
      name    = "alerts.${local.extra_domain_name}"
      zone_id = data.aws_route53_zone.extra_domain.zone_id
    },
    {
      name    = "*.alerts.${local.extra_domain_name}"
      zone_id = data.aws_route53_zone.extra_domain.zone_id
    }
  ]

  wait_for_validation = true

  tags = {
    Name = local.primary_domain_name
  }
}
