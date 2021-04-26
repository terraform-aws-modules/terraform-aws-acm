# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



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
- Merge pull request [#46](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/46) from terraform-aws-modules/terraform-provider-githubfile-1584635020736654000
- [ci skip] Create ".chglog/CHANGELOG.tpl.md".
- Merge pull request [#45](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/45) from terraform-aws-modules/terraform-provider-githubfile-1584531592337142000
- [ci skip] Update ".pre-commit-config.yaml".
- Merge pull request [#44](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/44) from terraform-aws-modules/terraform-provider-githubfile-1584531435556216000
- Update ".pre-commit-config.yaml".
- Merge pull request [#43](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/43) from terraform-aws-modules/terraform-provider-githubfile-1584531247134713000
- Create "LICENSE".
- Merge pull request [#40](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/40) from terraform-aws-modules/terraform-provider-githubfile-1584531188174100000
- Merge pull request [#42](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/42) from terraform-aws-modules/terraform-provider-githubfile-1584531188174140000
- Merge pull request [#41](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/41) from terraform-aws-modules/terraform-provider-githubfile-1584531188174576000
- Merge pull request [#39](https://github.com/terraform-aws-modules/terraform-aws-acm/issues/39) from terraform-aws-modules/terraform-provider-githubfile-1584531188174153000
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


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v3.0.0...HEAD
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
