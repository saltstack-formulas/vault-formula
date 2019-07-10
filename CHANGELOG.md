# Changelog

# [1.1.0](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.6...v1.1.0) (2019-07-10)


### Bug Fixes

* **package:** explicitly require package providing setcap ([d476700](https://github.com/saltstack-formulas/vault-formula/commit/d476700))
* **user:** handle removal of `gid_from_name` in Salt develop branch ([dee3748](https://github.com/saltstack-formulas/vault-formula/commit/dee3748)), closes [saltstack/salt#48640](https://github.com/saltstack/salt/issues/48640)


### Code Refactoring

* **defaults:** place common values in defaults.yaml ([3656e31](https://github.com/saltstack-formulas/vault-formula/commit/3656e31))


### Continuous Integration

* **kitchen+travis:** bring into line with `template-formula` ([34f05bd](https://github.com/saltstack-formulas/vault-formula/commit/34f05bd))


### Features

* add support for openSUSE ([76b8ac3](https://github.com/saltstack-formulas/vault-formula/commit/76b8ac3))


### Tests

* **user+group:** test for vault user/group existence ([ff5cdf9](https://github.com/saltstack-formulas/vault-formula/commit/ff5cdf9))

## [1.0.6](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.5...v1.0.6) (2019-06-24)


### Bug Fixes

* use gpg2 ([d755cb4](https://github.com/saltstack-formulas/vault-formula/commit/d755cb4))

## [1.0.5](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.4...v1.0.5) (2019-05-15)


### Documentation

* **readme:** move requirements section under testing header ([dfca3a6](https://github.com/saltstack-formulas/vault-formula/commit/dfca3a6))

## [1.0.4](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.3...v1.0.4) (2019-05-14)


### Continuous Integration

* **kitchen:** don't put Gemfile.lock in git ([cfd5daf](https://github.com/saltstack-formulas/vault-formula/commit/cfd5daf))
* **kitchen:** update Gemfile from template-formula ([541ec63](https://github.com/saltstack-formulas/vault-formula/commit/541ec63))
* **travis:** use default bundler on Travis ([b9f40b3](https://github.com/saltstack-formulas/vault-formula/commit/b9f40b3))


### Documentation

* **readme:** restore requirements section ([5f2256c](https://github.com/saltstack-formulas/vault-formula/commit/5f2256c))

## [1.0.3](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.2...v1.0.3) (2019-05-13)


### Documentation

* **readme:** improve readme sections ([10e2bde](https://github.com/saltstack-formulas/vault-formula/commit/10e2bde))

## [1.0.2](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.1...v1.0.2) (2019-05-13)


### Documentation

* **readme:** update readme, add badges ([1fc3142](https://github.com/saltstack-formulas/vault-formula/commit/1fc3142))

## [1.0.1](https://github.com/saltstack-formulas/vault-formula/compare/v1.0.0...v1.0.1) (2019-04-20)


### Code Refactoring

* **kitchen:** prefer `kitchen.yml` to `.kitchen.yml` ([5baaf24](https://github.com/saltstack-formulas/vault-formula/commit/5baaf24))

# [1.0.0](https://github.com/saltstack-formulas/vault-formula/compare/v0.5.1...v1.0.0) (2019-04-01)


### Bug Fixes

* **everything:** review comments & tests ([297d784](https://github.com/saltstack-formulas/vault-formula/commit/297d784))
* **package:** add missed cleanup & add storage backend to prod test ([d0ed5e5](https://github.com/saltstack-formulas/vault-formula/commit/d0ed5e5))
* **package:** fix more review comments ([65482c2](https://github.com/saltstack-formulas/vault-formula/commit/65482c2))
* **service:** re-add support for Ubuntu 14.04 and older ([1b1611f](https://github.com/saltstack-formulas/vault-formula/commit/1b1611f))
* **upgrade:** upgrade procedure & add MacOS platform ([b7b0d1d](https://github.com/saltstack-formulas/vault-formula/commit/b7b0d1d))


### Code Refactoring

* **everything:** overhaul to align with the template-formula ([15d4e34](https://github.com/saltstack-formulas/vault-formula/commit/15d4e34))
* **map.jinja:** cleanup map.jinja merge & add lookup ([a640f01](https://github.com/saltstack-formulas/vault-formula/commit/a640f01))
* **service:** move config watch statement as it breaks in dev_mode ([c6ce242](https://github.com/saltstack-formulas/vault-formula/commit/c6ce242))


### Features

* **version:** bump version to 1.1.0 ([7671f87](https://github.com/saltstack-formulas/vault-formula/commit/7671f87))


### Reverts

* **defaults:** some defaults were incorrectly changed ([140db23](https://github.com/saltstack-formulas/vault-formula/commit/140db23))


### Tests

* **config:** correct more test cases ([507ee9f](https://github.com/saltstack-formulas/vault-formula/commit/507ee9f))
* **install_binary:** fix version & hash returned by vault v1.1.0 ([8d74960](https://github.com/saltstack-formulas/vault-formula/commit/8d74960))
* **kitchen:** change version pillar ([7fed7e6](https://github.com/saltstack-formulas/vault-formula/commit/7fed7e6))
* **manual:** update test, clean link ([1f533d3](https://github.com/saltstack-formulas/vault-formula/commit/1f533d3))


### BREAKING CHANGES

* **everything:** This renames all states and the config file being
generated.

## [0.5.1](https://github.com/saltstack-formulas/vault-formula/compare/v0.5.0...v0.5.1) (2019-03-27)


### Documentation

* **semantic-release:** implement an automated changelog ([728ebd8](https://github.com/saltstack-formulas/vault-formula/commit/728ebd8)), closes [#24](https://github.com/saltstack-formulas/vault-formula/issues/24)
