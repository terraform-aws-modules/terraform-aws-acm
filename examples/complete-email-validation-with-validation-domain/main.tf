resource "aws_route53_zone" "this" {
  name = var.domain_name
}

module "acm" {
  source = "../../"

  domain_name = var.domain_name
  zone_id     = aws_route53_zone.this.zone_id

  # The key is the domain name which you want to change the validation domain for.
  # Validation emails will be send to a fixed list of recipients:
  # admin@VALIDATION_DOMAIN, administrator@VALIDATION_DOMAIN, hostmaster@VALIDATION_DOMAIN, postmaster@VALIDATION_DOMAIN, webmaster@VALIDATION_DOMAIN
  # validation_domain has to be a top-level domain of the actual domain
  validation_option = {
    (var.domain_name) = {
      validation_domain = var.validation_domain
    }
  }

  validation_method   = "EMAIL"
  wait_for_validation = false

  tags = {
    Name = var.domain_name
  }
}
