# Changelog

All notable changes to this project will be documented in this file.

### [4.0.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.0.0...v4.0.1) (2022-06-17)


### Bug Fixes

* Type of var.validation_option ([#112](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/112)) ([69c1f88](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/69c1f88acc6b1424062f50f13c06fe01bc4ad4fd))

## [4.0.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.5.0...v4.0.0) (2022-06-15)


### ⚠ BREAKING CHANGES

* Added validation_option configuration and upgraded AWS provider to v4 (#106)

### Features

* Added validation_option configuration and upgraded AWS provider to v4 ([#106](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/106)) ([0825e18](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/0825e1861fba92b068e02f97c3c26c2bcc0db5d9))

## [3.5.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.4.1...v3.5.0) (2022-05-25)


### Features

* Added new output for certificate status ([#110](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/110)) ([b63dfd7](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/b63dfd74c91c2eb796072d4d5c8fd76b39bb2887))

### [3.4.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.4.0...v3.4.1) (2022-04-15)


### Bug Fixes

* Fixed email validation method for ACM certificate ([#104](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/104)) ([ced04a3](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/ced04a3c9e0bed575a9de7eb99fa2afe0e3ea6d3))

## [3.4.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.3.0...v3.4.0) (2022-03-12)


### Features

* Made it clear that we stand with Ukraine ([57d7304](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/57d730473bbe445cefde9e9642e4fa5d1276b74b))

## [3.3.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.2.1...v3.3.0) (2022-01-14)


### Features

* Allow validating the certificate with CloudFlare ([#101](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/101)) ([a9a3c23](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/a9a3c2394df74de5235f6bbba260f186194c27f8))

## [3.2.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.2.0...v3.2.1) (2021-11-22)


### Bug Fixes

* update CI/CD process to enable auto-release workflow ([#96](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/96)) ([a9010ce](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/a9010ce14177336f2704231bb18c3889f9704a84))

<a name="v3.2.0"></a>
## [v3.2.0] - 2021-06-28

- docs: Add note in README about CloudFront with ACM ([#79](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/79))


<a name="v3.1.0"></a>
## [v3.1.0] - 2021-06-28

- fix: create missing validation records in cases (eg, wildcard SAN) ([#89](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/89))
- chore: update CI/CD to use latest `terraform-docs` and discoverable Apache2.0 license ([#85](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/85))


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-04-26

- feat: Shorten outputs (removing this_) ([#83](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/83))
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#78](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/78))
- chore: align ci-cd static checks to use individual minimum Terraform versions ([#76](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/76))


<a name="v2.14.0"></a>
## [v2.14.0] - 2021-02-24

- docs: Add note on how to handle off-by-one validation record issue when upgrading to +v2.13.0 ([#75](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/75))
- fix: bump min supported version due to types unsupported on current ([#74](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/74))
- chore: add ci-cd workflow for pre-commit checks ([#73](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/73))


<a name="v2.13.0"></a>
## [v2.13.0] - 2021-02-19

- fix: Fixed wildcard in domain names ([#71](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/71))


<a name="v2.12.0"></a>
## [v2.12.0] - 2020-11-04

- feat: Updated version requirements to support Terraform 0.14 also ([#66](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/66))


<a name="v2.11.0"></a>
## [v2.11.0] - 2020-08-17

- fix: Wait for correct certificate_arn when validation is enabled ([#55](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/55))


<a name="v2.10.0"></a>
## [v2.10.0] - 2020-08-13

- feat: Bump version of AWS provider to support v3


<a name="v2.9.0"></a>
## [v2.9.0] - 2020-06-24

- feat: Added dns ttl as variable ([#54](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/54))


<a name="v2.8.0"></a>
## [v2.8.0] - 2020-06-11

- fix: certificate_transparency_logging_preference to default to `true` ([#51](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/51))


<a name="v2.7.0"></a>
## [v2.7.0] - 2020-06-10

- Fixed syntax error in newly added options block for certificate trans… ([#50](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/50))


<a name="v2.6.0"></a>
## [v2.6.0] - 2020-06-10

- Updated README
- feat: Add certificate transparency log option to ACM ([#18](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/18))
- Update ".pre-commit-config.yaml".
- Create "LICENSE".
- Create ".gitignore".
- Create ".pre-commit-config.yaml".
- Create "Makefile".
- Create ".editorconfig".


<a name="v2.5.0"></a>
## [v2.5.0] - 2019-12-19

- Updated example with multiple SANs after PR [#32](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/32)
- Fixing validation records when wildcard is present with alternative domains ([#32](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/32))


<a name="v2.4.0"></a>
## [v2.4.0] - 2019-11-12

- Updated pre-commit hooks
- Define local.validation_domains properly. ([#28](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/28))


<a name="v2.3.0"></a>
## [v2.3.0] - 2019-09-02

- Updated pre-commit hooks
- Replace template usage with 0.12 compatible list comprehension ([#17](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/17))


<a name="v2.2.0"></a>
## [v2.2.0] - 2019-07-08

- Improved access by index to help with deletion (relates to [#10](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/10))


<a name="v2.1.0"></a>
## [v2.1.0] - 2019-06-17

- Updated pre-commit-terraform to support terraform-docs and Terraform 0.12
- Terraform.012 upgrade ([#9](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/9))


<a name="v1.4.0"></a>
## [v1.4.0] - 2019-06-13

- Fixed docs after [#11](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/11)
- validation_allow_overwrite_records variable to allow overwrite records ([#11](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/11))


<a name="v2.0.0"></a>
## [v2.0.0] - 2019-06-05

- Terraform.012 upgrade ([#9](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/9))


<a name="v1.3.0"></a>
## [v1.3.0] - 2019-05-30

- fix format issue ([#6](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/6))


<a name="v1.2.0"></a>
## [v1.2.0] - 2019-02-14

- Added multiple records for route53 validation (related to [#1](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/1))


<a name="v1.1.0"></a>
## [v1.1.0] - 2019-02-01

- Fixed bug when creation was disabled


<a name="v1.0.0"></a>
## v1.0.0 - 2018-12-13

- Updated readme
- Initial commit with all the code


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.2.0...HEAD
[v3.2.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.1.0...v3.2.0
[v3.1.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.0.0...v3.1.0
[v3.0.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.14.0...v3.0.0
[v2.14.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.13.0...v2.14.0
[v2.13.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.12.0...v2.13.0
[v2.12.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.11.0...v2.12.0
[v2.11.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.10.0...v2.11.0
[v2.10.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.9.0...v2.10.0
[v2.9.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.8.0...v2.9.0
[v2.8.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.7.0...v2.8.0
[v2.7.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.6.0...v2.7.0
[v2.6.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.5.0...v2.6.0
[v2.5.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.4.0...v2.5.0
[v2.4.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.3.0...v2.4.0
[v2.3.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.2.0...v2.3.0
[v2.2.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.1.0...v2.2.0
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v1.4.0...v2.1.0
[v1.4.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.0.0...v1.4.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v1.3.0...v2.0.0
[v1.3.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v1.0.0...v1.1.0
