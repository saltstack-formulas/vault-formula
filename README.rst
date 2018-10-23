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

To use it, just include *vault.server* in your *top.sls*, and configure it using pillars:

::

  vault:
    version: 0.7.0
    listen_protocol: tcp
    listen_port: 8200
    listen_address: 0.0.0.0
    tls_disable: 0
    default_lease_ttl: 24h
    max_lease_ttl: 24h
    self_signed_cert:
      enabled: false
    backend: {}
    dev_mode: true

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
