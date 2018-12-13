variable "domain_name" {
  description = "Domain name to use as Route53 zone and ACM certificate"
  default     = "my-domain-name.com"
}

resource "aws_route53_zone" "this" {
  name = "${var.domain_name}"
}

module "acm" {
  source = "../../"

  domain_name = "${var.domain_name}"
  zone_id     = "${aws_route53_zone.this.zone_id}"

  subject_alternative_names = [
    "*.${var.domain_name}",
  ]

  wait_for_validation = false # true

  tags = {
    Name = "${var.domain_name}"
  }
}
