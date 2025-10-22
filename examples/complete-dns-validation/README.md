# Complete ACM example with Route53 DNS validation

Configuration in this directory creates new Route53 zone and ACM certificate (valid for the domain name and wildcard) with one (default) or two instances of AWS providers (one to manage ACM resources, another to manage Route53 records).

Also, ACM certificate is being validate using DNS method.

This is a complete example which fits most of scenarios.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ../../ | n/a |
| <a name="module_acm_multi_domain"></a> [acm\_multi\_domain](#module\_acm\_multi\_domain) | ../../ | n/a |
| <a name="module_acm_only"></a> [acm\_only](#module\_acm\_only) | ../../ | n/a |
| <a name="module_route53_records_only"></a> [route53\_records\_only](#module\_route53\_records\_only) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domain to be used for the tests | `string` | `"terraform-aws-modules.modules.tf"` | no |
| <a name="input_extra_domain"></a> [extra\_domain](#input\_extra\_domain) | Extra domain to be used in acm\_multi\_domain module | `string` | `"extra.terraform-aws-modules.modules.tf"` | no |
| <a name="input_use_existing_route53_zone"></a> [use\_existing\_route53\_zone](#input\_use\_existing\_route53\_zone) | Use existing (via data source) or create new zone (will fail validation, if zone is not reachable) | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_acm_certificate_domain_validation_options"></a> [acm\_certificate\_domain\_validation\_options](#output\_acm\_certificate\_domain\_validation\_options) | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| <a name="output_acm_certificate_status"></a> [acm\_certificate\_status](#output\_acm\_certificate\_status) | Status of the certificate. |
| <a name="output_acm_certificate_validation_emails"></a> [acm\_certificate\_validation\_emails](#output\_acm\_certificate\_validation\_emails) | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |
| <a name="output_distinct_domain_names"></a> [distinct\_domain\_names](#output\_distinct\_domain\_names) | List of distinct domains names used for the validation. |
| <a name="output_validation_domains"></a> [validation\_domains](#output\_validation\_domains) | List of distinct domain validation options. This is useful if subject alternative names contain wildcards. |
| <a name="output_validation_route53_record_fqdns"></a> [validation\_route53\_record\_fqdns](#output\_validation\_route53\_record\_fqdns) | List of FQDNs built using the zone domain and name. |
<!-- END_TF_DOCS -->
