resource "aws_ssm_parameter" "acm_certificate_arn" {
  name        = "/shared/acm_certificate_arn"
  description = "ACM ARN"
  type        = "StringList"
  value       = element(concat(aws_acm_certificate_validation.this.*.certificate_arn, aws_acm_certificate.this.*.arn, [""]), 0)
