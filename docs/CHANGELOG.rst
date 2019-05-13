
Changelog
=========

`1.0.3 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.2...v1.0.3>`_ (2019-05-13)
-------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **readme:** improve readme sections (\ `10e2bde <https://github.com/saltstack-formulas/vault-formula/commit/10e2bde>`_\ )

`1.0.2 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.1...v1.0.2>`_ (2019-05-13)
-------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **readme:** update readme, add badges (\ `1fc3142 <https://github.com/saltstack-formulas/vault-formula/commit/1fc3142>`_\ )

`1.0.1 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.0...v1.0.1>`_ (2019-04-20)
-------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **kitchen:** prefer ``kitchen.yml`` to ``.kitchen.yml`` (\ `5baaf24 <https://github.com/saltstack-formulas/vault-formula/commit/5baaf24>`_\ )

`1.0.0 <https://github.com/saltstack-formulas/vault-formula/compare/v0.5.1...v1.0.0>`_ (2019-04-01)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **everything:** review comments & tests (\ `297d784 <https://github.com/saltstack-formulas/vault-formula/commit/297d784>`_\ )
* **package:** add missed cleanup & add storage backend to prod test (\ `d0ed5e5 <https://github.com/saltstack-formulas/vault-formula/commit/d0ed5e5>`_\ )
* **package:** fix more review comments (\ `65482c2 <https://github.com/saltstack-formulas/vault-formula/commit/65482c2>`_\ )
* **service:** re-add support for Ubuntu 14.04 and older (\ `1b1611f <https://github.com/saltstack-formulas/vault-formula/commit/1b1611f>`_\ )
* **upgrade:** upgrade procedure & add MacOS platform (\ `b7b0d1d <https://github.com/saltstack-formulas/vault-formula/commit/b7b0d1d>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **everything:** overhaul to align with the template-formula (\ `15d4e34 <https://github.com/saltstack-formulas/vault-formula/commit/15d4e34>`_\ )
* **map.jinja:** cleanup map.jinja merge & add lookup (\ `a640f01 <https://github.com/saltstack-formulas/vault-formula/commit/a640f01>`_\ )
* **service:** move config watch statement as it breaks in dev_mode (\ `c6ce242 <https://github.com/saltstack-formulas/vault-formula/commit/c6ce242>`_\ )

Features
^^^^^^^^


* **version:** bump version to 1.1.0 (\ `7671f87 <https://github.com/saltstack-formulas/vault-formula/commit/7671f87>`_\ )

Reverts
^^^^^^^


* **defaults:** some defaults were incorrectly changed (\ `140db23 <https://github.com/saltstack-formulas/vault-formula/commit/140db23>`_\ )

Tests
^^^^^


* **config:** correct more test cases (\ `507ee9f <https://github.com/saltstack-formulas/vault-formula/commit/507ee9f>`_\ )
* **install_binary:** fix version & hash returned by vault v1.1.0 (\ `8d74960 <https://github.com/saltstack-formulas/vault-formula/commit/8d74960>`_\ )
* **kitchen:** change version pillar (\ `7fed7e6 <https://github.com/saltstack-formulas/vault-formula/commit/7fed7e6>`_\ )
* **manual:** update test, clean link (\ `1f533d3 <https://github.com/saltstack-formulas/vault-formula/commit/1f533d3>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **everything:** This renames all states and the config file being
  generated.

`0.5.1 <https://github.com/saltstack-formulas/vault-formula/compare/v0.5.0...v0.5.1>`_ (2019-03-27)
-------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **semantic-release:** implement an automated changelog (\ `728ebd8 <https://github.com/saltstack-formulas/vault-formula/commit/728ebd8>`_\ ), closes `#24 <https://github.com/saltstack-formulas/vault-formula/issues/24>`_
