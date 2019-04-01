======
Vault
======

.. image:: https://travis-ci.org/saltstack-formulas/vault-formula.svg?branch=master

Formulas for working with `Vault <http://www.vaultproject.io>`_

Available states
================

.. contents::
    :local:

``vault``
----------

Install the vault binary


``vault.server``
---------------------

Install and configure the vault server

To use it, just include *vault* in your *top.sls*, and configure it using pillars:

::

  vault:
    version: 1.1.0
    platform: linux_amd64
    dev_mode: True
    verify_download: True
    config:
      storage:
        file:
          path: /var/lib/vault/data
      listener:
        tcp:
          address: "127.0.0.1:8200"
          tls_disable: True
          tls_cert_file: ""
          tls_key_file: ""
      default_lease_ttl: 768h
      max_lease_ttl: 768h

Issues
======

Vault `v0.10.0 <https://github.com/hashicorp/vault/blob/master/CHANGELOG.md#0100-april-10th-2018>`_ introduces a revamped versioned kv backend (version 2), with a breaking change in the paths used to read/write data. This backend is enabled by default when dev mode is enabled.

The Salt execution modules are not compatible with this new backend, therefore if you intend to access Vault in dev mode using the Salt modules, it's suggested to use an outdated, but compatible version of Vault by setting a pillar value e.g. ``version: 0.9.6``.

Testing
=======

Testing is done with `Test Kitchen <http://kitchen.ci/>`_
for machine setup and `inspec <https://github.com/chef/inspec/>`_
for integration tests.

Requirements
------------

* Ruby
* Docker

::

    gem install bundler
    bundle install
    bundle exec kitchen test all
