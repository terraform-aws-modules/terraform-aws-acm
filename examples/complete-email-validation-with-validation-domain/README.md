# Complete ACM example with EMAIL validation with validation_domain configured

Configuration in this directory creates new Route53 zone and ACM certificate (valid for the domain name and wildcard).

ACM certificate will be created with EMAIL validation method, which means that emails will be send to domain owners and it is not possible to automate using Terraform!
The validation domain option is set, which overrides the domain to which validation emails will be sent.

If you want to use EMAIL validation method make sure that you have access to at least one of these emails in your domain:

```
hostmaster@VALIDATION_DOMAIN
postmaster@VALIDATION_DOMAIN
admin@VALIDATION_DOMAIN
administrator@VALIDATION_DOMAIN
webmaster@VALIDATION_DOMAIN
```

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var 'domain_name=foo.bar.com' -var 'validation_domain=bar.com'
$ terraform apply -var 'domain_name=foo.bar.com' -var 'validation_domain=bar.com'
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name to use as Route53 zone and ACM certificate | `string` | n/a | yes |
| <a name="input_validation_domain"></a> [validation\_domain](#input\_validation\_domain) | Domain name to use for verifying var.domain\_name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_acm_certificate_domain_validation_options"></a> [acm\_certificate\_domain\_validation\_options](#output\_acm\_certificate\_domain\_validation\_options) | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| <a name="output_acm_certificate_validation_emails"></a> [acm\_certificate\_validation\_emails](#output\_acm\_certificate\_validation\_emails) | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
