# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



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


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-acm/compare/v2.7.0...HEAD
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
