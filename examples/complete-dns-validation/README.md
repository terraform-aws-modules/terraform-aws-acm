# Complete ACM example with Route53 DNS validation

Configuration in this directory creates new Route53 zone and ACM certificate (valid for the domain name and wildcard).

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain\_name | Domain name to use as Route53 zone and ACM certificate | string | `"my-domain-name.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| distinct\_domain\_names | List of distinct domains names used for the validation. |
| this\_acm\_certificate\_arn | The ARN of the certificate |
| this\_acm\_certificate\_domain\_validation\_options | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| this\_acm\_certificate\_validation\_emails | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |
| validation\_domains | List of distinct domain validation options. This is useful if subject alternative names contain wildcards. |
| validation\_route53\_record\_fqdns | List of FQDNs built using the zone domain and name. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
