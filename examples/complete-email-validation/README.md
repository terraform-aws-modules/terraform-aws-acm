# Complete ACM example with EMAIL validation

Configuration in this directory creates new Route53 zone and ACM certificate (valid for the domain name and wildcard).

ACM certificate will be created with EMAIL validation method, which means that emails will be send to domain owners and it is not possible to automate using Terraform!

If you want to use EMAIL validation method make sure that you have access to at least one of these emails in your domain:

```
hostmaster@...
postmaster@...
admin@...
administrator@...
webmaster@...
hostmaster@...
postmaster@...
admin@...
administrator@...
webmaster@...
```

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.53 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.53 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| acm | ../../ |  |

## Resources

| Name |
|------|
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/2.53/docs/resources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain\_name | Domain name to use as Route53 zone and ACM certificate | `string` | `"my-domain-name2.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_acm\_certificate\_arn | The ARN of the certificate |
| this\_acm\_certificate\_domain\_validation\_options | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| this\_acm\_certificate\_validation\_emails | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
