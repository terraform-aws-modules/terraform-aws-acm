provider "aws" {
  region = "us-east-1"
}

variable "domain_name" {
  description = "Domain name to use as Route53 zone and ACM certificate"
  default     = "my-domain-name2.com"
}

resource "aws_route53_zone" "this" {
  name = var.domain_name
}

module "acm" {
  source = "../../"

  domain_name = var.domain_name
  zone_id     = aws_route53_zone.this.zone_id

  subject_alternative_names = [
    "*.${var.domain_name}",
  ]

  validation_method = "EMAIL"

  tags = {
    Name = var.domain_name
  }

  providers = {
    aws = aws
    # use different aws provider
    # if hosted zone is in another aws account
    aws.route53 = aws
  }
}
