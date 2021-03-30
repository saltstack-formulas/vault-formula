.. _readme:

vault-formula
=============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/vault-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/vault-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formulas for working with `Vault <http://www.vaultproject.io>`_.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

.. contents::
    :local:

``vault``
^^^^^^^^^

Install the vault binary


``vault.server``
^^^^^^^^^^^^^^^^

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
-------

Vault `v0.10.0 <https://github.com/hashicorp/vault/blob/master/CHANGELOG.md#0100-april-10th-2018>`_ introduces a revamped versioned kv backend (version 2), with a breaking change in the paths used to read/write data. This backend is enabled by default when dev mode is enabled.

The Salt execution modules are not compatible with this new backend, therefore if you intend to access Vault in dev mode using the Salt modules, it's suggested to use an outdated, but compatible version of Vault by setting a pillar value e.g. ``version: 0.9.6``.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

::

  gem install bundler
  bundle install
  bundle exec kitchen test all

``kitchen converge``
^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``vault`` main states, ready for testing.

``kitchen verify``
^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``kitchen destroy``
^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``kitchen test``
^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``kitchen login``
^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

Testing with Vagrant
--------------------

Windows/FreeBSD/OpenBSD testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Virtualbox
* Vagrant

Setup
^^^^^

.. code-block:: bash

   $ gem install bundler
   $ bundle install --with=vagrant
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.vagrant.yml``,
e.g. ``windows-81-latest-py3``.

Note
^^^^

When testing using Vagrant you must set the environment variable ``KITCHEN_LOCAL_YAML`` to ``kitchen.vagrant.yml``.  For example:

.. code-block:: bash

   $ KITCHEN_LOCAL_YAML=kitchen.vagrant.yml bin/kitchen test      # Alternatively,
   $ export KITCHEN_LOCAL_YAML=kitchen.vagrant.yml
   $ bin/kitchen test

Then run the following commands as needed.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the Vagrant instance and runs the ``vault`` main states, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the Vagrant instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you RDP/SSH access to the instance for manual testing.
