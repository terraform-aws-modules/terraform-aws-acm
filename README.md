# AWS Certificate Manager (ACM) Terraform module

Terraform module which creates ACM certificates and validates them using Route53 DNS (recommended) or e-mail.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Usage with Route53 DNS validation (recommended)

```hcl
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "my-domain.com"
  zone_id      = "Z2ES7B9AZ6SHAE"

  validation_method = "DNS"

  subject_alternative_names = [
    "*.my-domain.com",
    "app.sub.my-domain.com",
  ]

  wait_for_validation = true

  tags = {
    Name = "my-domain.com"
  }
}
```

## Usage with external DNS validation (e.g. CloudFlare)

```hcl
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = "weekly.tf"
  zone_id     = "b7d259641bf30b89887c943ffc9d2138"

  validation_method = "DNS"

  subject_alternative_names = [
    "*.weekly.tf",
  ]

  create_route53_records  = false
  validation_record_fqdns = [
    "_689571ee9a5f9ec307c512c5d851e25a.weekly.tf",
  ]

  tags = {
    Name = "weekly.tf"
  }
}

```

## [Usage with CloudFront](https://aws.amazon.com/premiumsupport/knowledge-center/install-ssl-cloudfront/)

```hcl
# CloudFront supports US East (N. Virginia) Region only.
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

module "acm" {
  source = "terraform-aws-modules/acm/aws"

  providers = {
    aws = aws.us-east-1
  }

  domain_name = "my-domain.com"
  zone_id     = "Z266PL4W4W6MSG"

  validation_method = "DNS"

  wait_for_validation = true

  tags = {
    Name = "my-domain.com"
  }
}
```

## Usage with Route53 DNS validation and separate AWS providers

```hcl
provider "aws" {
  alias = "acm"
}

provider "aws" {
  alias = "route53"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  providers = {
    aws = aws.acm
  }

  domain_name  = "my-domain.com"

  subject_alternative_names = [
    "*.my-domain.com",
    "app.sub.my-domain.com",
  ]

  validation_method = "DNS"

  create_route53_records  = false
  validation_record_fqdns = module.route53_records.validation_route53_record_fqdns
}

module "route53_records" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  providers = {
    aws = aws.route53
  }

  create_certificate          = false
  create_route53_records_only = true

  validation_method = "DNS"

  distinct_domain_names = module.acm.distinct_domain_names
  zone_id               = "Z266PL4W4W6MSG"

  acm_certificate_domain_validation_options = module.acm.acm_certificate_domain_validation_options
}
```

## Examples

- [Complete example with DNS validation (recommended)](https://github.com/terraform-aws-modules/terraform-aws-acm/tree/master/examples/complete-dns-validation)
- [Complete example with DNS validation via external DNS provider (CloudFlare)](https://github.com/terraform-aws-modules/terraform-aws-acm/tree/master/examples/complete-dns-validation-with-cloudflare)
- [Complete example with EMAIL validation](https://github.com/terraform-aws-modules/terraform-aws-acm/tree/master/examples/complete-email-validation)
- [Complete example with EMAIL validation and validation domain override](https://github.com/terraform-aws-modules/terraform-aws-acm/tree/master/examples/complete-email-validation-with-validation-domain)

## Conditional creation and validation

Sometimes you need to have a way to create ACM certificate conditionally but Terraform does not allow to use `count` inside `module` block, so the solution is to specify argument `create_certificate`.

```hcl
module "acm" {
  source = "terraform-aws-modules/acm/aws"

  create_certificate = false
  # ... omitted
}
```

Similarly, to disable DNS validation of ACM certificate:

```hcl
module "acm" {
  source = "terraform-aws-modules/acm/aws"

  validate_certificate = false
  # ... omitted
}
```

## Notes

- For use in an automated pipeline consider setting the `wait_for_validation = false` to avoid waiting for validation to complete or error after a 45 minute timeout.
- If you're upgrading to [v2.13.0](https://github.com/terraform-aws-modules/terraform-aws-acm/releases/v2.13.0) or above, you might be subject to [off-by-one validation record issue](https://github.com/terraform-aws-modules/terraform-aws-acm/pull/47#issuecomment-754778599). You can solve this without compromising existing validation records by issuing `terraform state rm <your_module_name>.validation[1]` where `[1]` can be a different index # depending on the number of validation records your module creates (you can check this with `terraform state list module.<your_module_name>.validation`).

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_domain_validation_options"></a> [acm\_certificate\_domain\_validation\_options](#input\_acm\_certificate\_domain\_validation\_options) | A list of domain\_validation\_options created by the ACM certificate to create required Route53 records from it (used when create\_route53\_records\_only is set to true) | `any` | `{}` | no |
| <a name="input_certificate_transparency_logging_preference"></a> [certificate\_transparency\_logging\_preference](#input\_certificate\_transparency\_logging\_preference) | Specifies whether certificate details should be added to a certificate transparency log | `bool` | `true` | no |
| <a name="input_create_certificate"></a> [create\_certificate](#input\_create\_certificate) | Whether to create ACM certificate | `bool` | `true` | no |
| <a name="input_create_route53_records"></a> [create\_route53\_records](#input\_create\_route53\_records) | When validation is set to DNS, define whether to create the DNS records internally via Route53 or externally using any DNS provider | `bool` | `true` | no |
| <a name="input_create_route53_records_only"></a> [create\_route53\_records\_only](#input\_create\_route53\_records\_only) | Whether to create only Route53 records (e.g. using separate AWS provider) | `bool` | `false` | no |
| <a name="input_distinct_domain_names"></a> [distinct\_domain\_names](#input\_distinct\_domain\_names) | List of distinct domains and SANs (used when create\_route53\_records\_only is set to true) | `list(string)` | `[]` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | The TTL of DNS recursive resolvers to cache information about this record. | `number` | `60` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name for which the certificate should be issued | `string` | `""` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data | `string` | `null` | no |
| <a name="input_putin_khuylo"></a> [putin\_khuylo](#input\_putin\_khuylo) | Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo! | `bool` | `true` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | A list of domains that should be SANs in the issued certificate | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_validate_certificate"></a> [validate\_certificate](#input\_validate\_certificate) | Whether to validate certificate by creating Route53 record | `bool` | `true` | no |
| <a name="input_validation_allow_overwrite_records"></a> [validation\_allow\_overwrite\_records](#input\_validation\_allow\_overwrite\_records) | Whether to allow overwrite of Route53 records | `bool` | `true` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform. | `string` | `null` | no |
| <a name="input_validation_option"></a> [validation\_option](#input\_validation\_option) | The domain name that you want ACM to use to send you validation emails. This domain name is the suffix of the email addresses that you want ACM to use. | `any` | `{}` | no |
| <a name="input_validation_record_fqdns"></a> [validation\_record\_fqdns](#input\_validation\_record\_fqdns) | When validation is set to DNS and the DNS validation records are set externally, provide the fqdns for the validation | `list(string)` | `[]` | no |
| <a name="input_validation_timeout"></a> [validation\_timeout](#input\_validation\_timeout) | Define maximum timeout to wait for the validation to complete | `string` | `null` | no |
| <a name="input_wait_for_validation"></a> [wait\_for\_validation](#input\_wait\_for\_validation) | Whether to wait for the validation to complete | `bool` | `true` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The ID of the hosted zone to contain this record. Required when validating via Route53 | `string` | `""` | no |

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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-acm/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-acm/tree/master/LICENSE) for full details.

## Additional information for users from Russia and Belarus

* Russia has [illegally annexed Crimea in 2014](https://en.wikipedia.org/wiki/Annexation_of_Crimea_by_the_Russian_Federation) and [brought the war in Donbas](https://en.wikipedia.org/wiki/War_in_Donbas) followed by [full-scale invasion of Ukraine in 2022](https://en.wikipedia.org/wiki/2022_Russian_invasion_of_Ukraine).
* Russia has brought sorrow and devastations to millions of Ukrainians, killed hundreds of innocent people, damaged thousands of buildings, and forced several million people to flee.
* [Putin khuylo!](https://en.wikipedia.org/wiki/Putin_khuylo!)
