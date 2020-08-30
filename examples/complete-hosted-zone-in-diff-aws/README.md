# Complete ACM example with Route53 DNS validation in another AWS account

Configuration in this directory creates new / use existing Route53 zone in `production`(another) AWS account with provided credentials and ACM certificate (valid for the domain name and wildcard) in `development` aws account.

Also, ACM certificate is being validate using DNS method.

## Usage

Make sure you have correct `aws` credentials set using profiles `development` and `production`.

Where,
development - `aws` account where ACM certificate needs to be created
production  - `aws` account where Route 53 zone exists / need to be created for DNS validation.

> Note: As per the use case, `aws` provider can be updated to use [assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#assume-role) for `production` account in `provider` configuration.

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

No input.

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
