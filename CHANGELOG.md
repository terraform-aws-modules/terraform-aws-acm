# Changelog

All notable changes to this project will be documented in this file.

## [5.0.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v5.0.0...v5.0.1) (2024-03-06)


### Bug Fixes

* Update CI workflow versions to remove deprecated runtime warnings ([#151](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/151)) ([859fb3c](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/859fb3c606855913d5bb7379bbdbdbedbd2970d9))

## [5.0.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.5.0...v5.0.0) (2023-10-05)


### ⚠ BREAKING CHANGES

* Remove `NONE` validation method and set default to `null` (#141)

### Features

* Remove `NONE` validation method and set default to `null` ([#141](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/141)) ([2cb2b7c](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/2cb2b7c907c68f4335afe41b731821043a01dad6))

## [4.5.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.4.0...v4.5.0) (2023-10-05)


### Features

* Revert of removing `NONE` validation method and set default to `null` ([#140](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/140)) ([2b53d66](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/2b53d66c534c15c45b5a462407ca622516dda102))

## [4.4.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.3.2...v4.4.0) (2023-10-03)


### Features

* Remove `NONE` validation method and set default to `null` ([#135](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/135)) ([b76d53e](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/b76d53ea923b0dca3815ea0fc297e204d707b2b1))

### [4.3.2](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.3.1...v4.3.2) (2023-01-24)


### Bug Fixes

* Upgrade CI workflows to use non-deprecated runtimes ([#130](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/130)) ([4cf8799](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/4cf8799b180165934d15caa4c01463d11a26f83b))
* Use a version for  to avoid GitHub API rate limiting on CI workflows ([#128](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/128)) ([62bc31a](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/62bc31a7c5fc1da8fcd8d7a71ba75cc33e8c3026))

### [4.3.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.3.0...v4.3.1) (2022-12-08)


### Bug Fixes

* Set correct version of AWS provider on module root ([#126](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/126)) ([7a0e3e3](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/7a0e3e3c20b270b6f4c8b202fdacc5aa6151be60))

## [4.3.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.2.0...v4.3.0) (2022-12-04)


### Features

* Add support to key algorithm argument ([#125](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/125)) ([e35292c](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/e35292caf55eb17f593a1d51283c1f598246f8ff))

## [4.2.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.1.1...v4.2.0) (2022-11-15)


### Features

* Make validation timeout configurable ([#124](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/124)) ([84c1941](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/84c194109ac2ac0455df92afc3edfd0e1248775f))

### [4.1.1](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.1.0...v4.1.1) (2022-11-14)


### Bug Fixes

* Update CI configuration files to use latest version ([#122](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/122)) ([8aa7fd0](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/8aa7fd0e5e07e5221ab859f6ae425fe653f0e6f7))

## [4.1.0](https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v4.0.1...v4.1.0) (2022-08-26)


### Features

* Cross-account DNS and ACM resource creation ([#114](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/114)) ([e24bb59](https://github.com/terraform-aws-modules/terraform-aws-acm/commit/e24bb590e0595f7bedce1b6fd1114d6e0738936a))

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
