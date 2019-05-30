resource "aws_acm_certificate" "this" {
  count = "${var.create_certificate}"

  domain_name               = "${var.domain_name}"
  subject_alternative_names = ["${var.subject_alternative_names}"]
  validation_method         = "${var.validation_method}"

  tags = "${var.tags}"

  lifecycle {
    create_before_destroy = true
  }
}

//data "aws_acm_certificate" "this" {
//  count = "${1 - var.create_certificate}"
//
//  domain = "${var.domain_name}"
//
//  types = ["${var.acm_certificate_types}"]
//  statuses = ["${var.acm_certificate_statuses}"]
//  most_recent = "${var.acm_certificate_most_recent}"
//}

resource "aws_route53_record" "validation" {
  count = "${var.create_certificate && var.validation_method == "DNS" && var.validate_certificate ? length(var.subject_alternative_names) + 1 : 0}"

  zone_id = "${var.zone_id}"
  name    = "${lookup(aws_acm_certificate.this[0].domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.this[0].domain_validation_options[count.index], "resource_record_type")}"
  ttl     = 60

  records = [
    "${lookup(aws_acm_certificate.this[0].domain_validation_options[count.index], "resource_record_value")}"
  ]
}

resource "aws_acm_certificate_validation" "this" {
  count = "${var.create_certificate && var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0}"

  certificate_arn = "${aws_acm_certificate.this[0].arn}"

  validation_record_fqdns = [
    "${aws_route53_record.validation.*.fqdn}",
  ]
}
