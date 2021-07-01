locals {
  # Use existing (via data source) or create new zones (will fail validation, if zone is not reachable)
  use_existing_route53_zones = true

  domain              = "terraform-aws-modules.modules.tf"
  alternate_domain    = "terraform-aws-modules.modules-alt.tf"
  alternate_subdomain = "sub.${local.alternate_domain}"

  # Removing trailing dot from domains - just to be sure :)
  domain_name              = trimsuffix(local.domain, ".")
  alternate_domain_name    = trimsuffix(local.alternate_domain, ".")
  alternate_subdomain_name = trimsuffix(local.alternate_subdomain, ".")

  domain_zone_id              = coalescelist(data.aws_route53_zone.domain.*.zone_id, aws_route53_zone.domain.*.zone_id)[0]
  alternate_domain_zone_id    = coalescelist(data.aws_route53_zone.alternate_domain.*.zone_id, aws_route53_zone.alternate_domain.*.zone_id)[0]
  alternate_subdomain_zone_id = coalescelist(data.aws_route53_zone.alternate_subdomain.*.zone_id, aws_route53_zone.alternate_subdomain.*.zone_id)[0]
}

data "aws_route53_zone" "domain" {
  count = local.use_existing_route53_zones ? 1 : 0

  name         = local.domain_name
  private_zone = false
}

data "aws_route53_zone" "alternate_domain" {
  count = local.use_existing_route53_zones ? 1 : 0

  name         = local.alternate_domain_name
  private_zone = false
}

data "aws_route53_zone" "alternate_subdomain" {
  count = local.use_existing_route53_zones ? 1 : 0

  name         = local.alternate_subdomain_name
  private_zone = false
}

resource "aws_route53_zone" "domain" {
  count = !local.use_existing_route53_zones ? 1 : 0
  name  = local.domain_name
}

resource "aws_route53_zone" "alternate_domain" {
  count = !local.use_existing_route53_zones ? 1 : 0
  name  = local.alternate_domain_name
}

resource "aws_route53_zone" "alternate_subdomain" {
  count = !local.use_existing_route53_zones ? 1 : 0
  name  = local.alternate_subdomain_name
}

resource "aws_route53_record" "alternate_subdomain_delegation" {
  count = !local.use_existing_route53_zones ? 1 : 0
  name  = local.alternate_subdomain_name
  type  = "NS"
  ttl   = 300
  records = aws_route53_zone.alternate_subdomain.*.name_servers[0]
  zone_id = aws_route53_zone.alternate_domain.*.zone_id[0]
}

module "acm" {
  source = "../../"

  domain_name = local.domain_name

  subject_alternative_names = [
    "*.alerts.${local.domain_name}",
    "new.sub.${local.domain_name}",
    "*.${local.domain_name}",
    "alerts.${local.domain_name}",
    local.alternate_domain_name,
    "*.${local.alternate_domain_name}",
    "quite.deep.abc.${local.alternate_subdomain_name}",
    "def.${local.alternate_subdomain_name}",
    "*.${local.alternate_subdomain_name}",
  ]

  domain_zones = {
    (local.domain_name)                                = { zone_id = local.domain_zone_id }
    "alerts.${local.domain_name}"                      = { zone_id = local.domain_zone_id }
    "new.sub.${local.domain_name}"                     = { zone_id = local.domain_zone_id }
    (local.alternate_domain_name)                      = { zone_id = local.alternate_domain_zone_id }
    (local.alternate_subdomain_name)                   = { zone_id = local.alternate_subdomain_zone_id }
    "def.${local.alternate_subdomain_name}"            = { zone_id = local.alternate_subdomain_zone_id }
    "quite.deep.abc.${local.alternate_subdomain_name}" = { zone_id = local.alternate_subdomain_zone_id }
  }

  wait_for_validation = true

  tags = {
    Name = local.domain_name
  }
}
