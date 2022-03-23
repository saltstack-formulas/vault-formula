
Changelog
=========

`1.3.0 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.5...v1.3.0>`_ (2022-03-23)
-------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* enable Vagrant-based testing using GitHub Actions (\ `16ec625 <https://github.com/saltstack-formulas/vault-formula/commit/16ec6258421265d4ae27e458d699650d7112588f>`_\ )
* update linters to latest versions [skip ci] (\ `b95d2c9 <https://github.com/saltstack-formulas/vault-formula/commit/b95d2c99b4b420404692d0633c58cdfd1b98bb4a>`_\ )
* **3003.1:** update inc. AlmaLinux, Rocky & ``rst-lint`` [skip ci] (\ `f80da8c <https://github.com/saltstack-formulas/vault-formula/commit/f80da8c5b5de81275a3825cacbbe36d03c77049e>`_\ )
* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] (\ `7f06dc1 <https://github.com/saltstack-formulas/vault-formula/commit/7f06dc1ff452641f566d85121aa9fd3af3fe04cc>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``inspec`` repo [skip ci] (\ `6eab66e <https://github.com/saltstack-formulas/vault-formula/commit/6eab66eea0d1ba5ce8d049ec990c5bbeb1139710>`_\ )
* **gitlab-ci:** allow failure for OpenSUSE Leap 15.2 [skip ci] (\ `bbb1e69 <https://github.com/saltstack-formulas/vault-formula/commit/bbb1e691dd6d351b1439f42dfedacbd9ef792e0b>`_\ )
* **kitchen:** move ``provisioner`` block & update ``run_command`` [skip ci] (\ `104b032 <https://github.com/saltstack-formulas/vault-formula/commit/104b032e5e46ea27aa646f553e2262a26f890f7a>`_\ )
* **kitchen+ci:** update with ``3004`` pre-salted images/boxes [skip ci] (\ `8d83b50 <https://github.com/saltstack-formulas/vault-formula/commit/8d83b50bd2326e61e31d91d9be75044b93000a29>`_\ )
* **kitchen+ci:** update with latest ``3003.2`` pre-salted images [skip ci] (\ `c2bd458 <https://github.com/saltstack-formulas/vault-formula/commit/c2bd458841a188c1f3f9b61d872576846b4b863a>`_\ )
* **kitchen+ci:** update with latest CVE pre-salted images [skip ci] (\ `dd0fc12 <https://github.com/saltstack-formulas/vault-formula/commit/dd0fc12084c27b0c0efeac71849b254cfed4971a>`_\ )
* **kitchen+gitlab:** update for new pre-salted images [skip ci] (\ `3a12912 <https://github.com/saltstack-formulas/vault-formula/commit/3a12912ed1a5d17f7593b0458f822416c7e65aa2>`_\ )
* add Debian 11 Bullseye & update ``yamllint`` configuration [skip ci] (\ `8a1c505 <https://github.com/saltstack-formulas/vault-formula/commit/8a1c505b0b054309e0949fcf914eb2fca251a68e>`_\ )
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] (\ `f044bcb <https://github.com/saltstack-formulas/vault-formula/commit/f044bcbfdc01fcbc949db4a850b609967fac451a>`_\ )
* add ``arch-master`` to matrix and update ``.travis.yml`` [skip ci] (\ `120c065 <https://github.com/saltstack-formulas/vault-formula/commit/120c06573f40f1a18da26eaab23ea9fd2371332c>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** add ``Testing with Vagrant`` section (\ `208e31b <https://github.com/saltstack-formulas/vault-formula/commit/208e31be37a28b4398c399be140e6fed50a83727>`_\ )

Features
^^^^^^^^


* **freebsd:** add FreeBSD support (\ `946e2d0 <https://github.com/saltstack-formulas/vault-formula/commit/946e2d0b49e66588301954aac70dce74135f99ec>`_\ )

Tests
^^^^^


* **pillar:** use ``disable_mlock`` for FreeBSD (Vagrant) (\ `94797f2 <https://github.com/saltstack-formulas/vault-formula/commit/94797f21d653ed13b0e38d729a30f35ff0591272>`_\ )
* update all for FreeBSD (\ `cb29f9d <https://github.com/saltstack-formulas/vault-formula/commit/cb29f9db1c67b18a34b121992f26bf01b862d832>`_\ )
* **system:** add ``build_platform_codename`` [skip ci] (\ `664bf33 <https://github.com/saltstack-formulas/vault-formula/commit/664bf33446ac6aa465508aa7fb81aa366d7edf21>`_\ )

`1.2.5 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.4...v1.2.5>`_ (2021-04-30)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **gpg:** update Hashicorp GPG key after HCSEC-2021-12 (\ `1b6d000 <https://github.com/saltstack-formulas/vault-formula/commit/1b6d000e9ab44aed7442c41f08ba2638bf19f81f>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+gitlab:** adjust matrix to add ``3003`` [skip ci] (\ `d7ea9ae <https://github.com/saltstack-formulas/vault-formula/commit/d7ea9ae7f4e082eab964ee98201f1e8be6c7685d>`_\ )

`1.2.4 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.3...v1.2.4>`_ (2021-04-17)
-------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **cert-gen.sh:** use ``sh`` not ``bash`` for portability (\ `860f1ba <https://github.com/saltstack-formulas/vault-formula/commit/860f1ba897b7cc7697786ad771f581eb4b41357e>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **commitlint:** ensure ``upstream/master`` uses main repo URL [skip ci] (\ `134d6f5 <https://github.com/saltstack-formulas/vault-formula/commit/134d6f5c88ca3652dd9719fae57c1b72c248fe48>`_\ )
* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `999e3c7 <https://github.com/saltstack-formulas/vault-formula/commit/999e3c7456becf3473776baeb9ac5a11e575922a>`_\ )
* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `c6bf47b <https://github.com/saltstack-formulas/vault-formula/commit/c6bf47b84525ada706d386a72bf29205c4bffc45>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``kitchen-docker`` repo [skip ci] (\ `f3c1007 <https://github.com/saltstack-formulas/vault-formula/commit/f3c10079754aee725a54a15781d1ec5cb450fbf7>`_\ )
* **gitlab-ci:** add ``rubocop`` linter (with ``allow_failure``\ ) [skip ci] (\ `31a61f8 <https://github.com/saltstack-formulas/vault-formula/commit/31a61f88ee27c9703a7d274853d7bee6614aaa7e>`_\ )
* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `0a90aa7 <https://github.com/saltstack-formulas/vault-formula/commit/0a90aa782633570279d391cd2a398868c9f19ca3>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `6d0cff0 <https://github.com/saltstack-formulas/vault-formula/commit/6d0cff052848a3c9a1334b65112e27c6caba5b91>`_\ )
* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `7403ecd <https://github.com/saltstack-formulas/vault-formula/commit/7403ecda559f3133f66005dca29ef832b0f44a45>`_\ )
* **kitchen:** use ``stable`` for ``amazonlinux-1`` bootstrap [skip ci] (\ `83930ff <https://github.com/saltstack-formulas/vault-formula/commit/83930ff0bc62f9cfe5cef161b7c735c02b9e1745>`_\ )
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] (\ `49e5671 <https://github.com/saltstack-formulas/vault-formula/commit/49e56719cbf8ca03568196f7c95fa434229b1776>`_\ )
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] (\ `d96b789 <https://github.com/saltstack-formulas/vault-formula/commit/d96b7899688677fbafc98f4fbdf8f987142b8e8c>`_\ )
* **kitchen+travis:** add new platforms [skip ci] (\ `98bad0d <https://github.com/saltstack-formulas/vault-formula/commit/98bad0d8eeeae9899bbde3a46062e03cc488a090>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.1`` & remove ``2017.7`` (\ `37ce4f4 <https://github.com/saltstack-formulas/vault-formula/commit/37ce4f4f5e5247c81630d04bade8f01c4cdd34a5>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.2`` & remove ``2018.3`` [skip ci] (\ `3ffb96f <https://github.com/saltstack-formulas/vault-formula/commit/3ffb96f20aa7b2b15897abc5998996972160eb41>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.3`` [skip ci] (\ `fe39213 <https://github.com/saltstack-formulas/vault-formula/commit/fe39213f1065bd950cd2ea44ee9706840031e915>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `43e6673 <https://github.com/saltstack-formulas/vault-formula/commit/43e6673c14c99f4767b0fa80886c82efa8ab8fda>`_\ )
* **pre-commit:** add to formula [skip ci] (\ `034157b <https://github.com/saltstack-formulas/vault-formula/commit/034157bbea2bd5237ab0fcaab47b380b7fc441fd>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `d8b64e3 <https://github.com/saltstack-formulas/vault-formula/commit/d8b64e3f7418d02c97e718506fc06b3e397bb9b3>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `e42dc17 <https://github.com/saltstack-formulas/vault-formula/commit/e42dc17e7af9dfa928b3caf211b222744067a3b7>`_\ )
* **pre-commit:** update hook for ``rubocop`` [skip ci] (\ `99be484 <https://github.com/saltstack-formulas/vault-formula/commit/99be48451b6a1093df4e34d0ec4d11e8248fd833>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `279a5b4 <https://github.com/saltstack-formulas/vault-formula/commit/279a5b447bb24af41c7a9964662d94c271273359>`_\ )
* **travis:** apply changes from build config validation [skip ci] (\ `d494294 <https://github.com/saltstack-formulas/vault-formula/commit/d494294a98171368cecfc95c5ef29ee4807c454d>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `b8e3f4f <https://github.com/saltstack-formulas/vault-formula/commit/b8e3f4faa46e1b7e089cd4f4d7618bd2de855b0b>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `f4beb33 <https://github.com/saltstack-formulas/vault-formula/commit/f4beb3368dd319474b7ef3b517df23f24f902bc6>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `c4090d6 <https://github.com/saltstack-formulas/vault-formula/commit/c4090d695886352314677b5968949a6e9c7fc082>`_\ )
* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `1ab3801 <https://github.com/saltstack-formulas/vault-formula/commit/1ab38018c69130a62c19006b81a324afdfc1bf67>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `b54b06d <https://github.com/saltstack-formulas/vault-formula/commit/b54b06d8c4c13998107b8eaf5dafb93b3c785d98>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `98e056a <https://github.com/saltstack-formulas/vault-formula/commit/98e056ada33c8e0c5db4eb0e6a8227f0cfe829dc>`_\ )

Tests
^^^^^


* standardise use of ``share`` suite & ``_mapdata`` state [skip ci] (\ `9877500 <https://github.com/saltstack-formulas/vault-formula/commit/9877500f0a13bbb68d0b7f1e625e9587369e62ef>`_\ )
* **prod_server:** fix regex for Arch and Tumbleweed as well (\ `9d673fa <https://github.com/saltstack-formulas/vault-formula/commit/9d673fa81d1e25c98ee37e47c9380639b47c75c3>`_\ )
* **rubocop:** fix remaining violations (\ `d289ce9 <https://github.com/saltstack-formulas/vault-formula/commit/d289ce9303637efc58f13ce71ec521fcad05231e>`_\ )

`1.2.3 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.2...v1.2.3>`_ (2019-11-07)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **release.config.js:** use full commit hash in commit link [skip ci] (\ `297db70 <https://github.com/saltstack-formulas/vault-formula/commit/297db702a9956dbfb24c3a9eb484bff151cdb3c2>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** use ``debian-10-master-py3`` instead of ``develop`` [skip ci] (\ `bc13a28 <https://github.com/saltstack-formulas/vault-formula/commit/bc13a28c4ca3a746dc9b79d87e66bd4cda566164>`_\ )
* **kitchen:** use ``develop`` image until ``master`` is ready (\ ``amazonlinux``\ ) [skip ci] (\ `c38389c <https://github.com/saltstack-formulas/vault-formula/commit/c38389c181dfb663c7783680f5f448676647882c>`_\ )
* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release [skip ci] (\ `8c9631e <https://github.com/saltstack-formulas/vault-formula/commit/8c9631efeaee70843ce1e727b47582292a192f33>`_\ )
* **kitchen+travis:** use bootstrapped ``amazonlinux-1`` images (\ `a9576e8 <https://github.com/saltstack-formulas/vault-formula/commit/a9576e816b292cd47abe4c609b794b16f879cc87>`_\ )
* **travis:** update ``salt-lint`` config for ``v0.0.10`` [skip ci] (\ `562874c <https://github.com/saltstack-formulas/vault-formula/commit/562874c1eba10f8cd196ca3fb965cb11a3333950>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ `af7f503 <https://github.com/saltstack-formulas/vault-formula/commit/af7f5037c0b15b481f1cfd3d24e18ab5faed5fb6>`_\ )

Documentation
^^^^^^^^^^^^^


* **contributing:** remove to use org-level file instead [skip ci] (\ `7214aa7 <https://github.com/saltstack-formulas/vault-formula/commit/7214aa7361104b183b16fea0b3bea0a1974ba46d>`_\ )
* **readme:** update link to ``CONTRIBUTING`` [skip ci] (\ `e5542dd <https://github.com/saltstack-formulas/vault-formula/commit/e5542dd3c4c1333340fa8f13ad1caf39f5552167>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `8b098a3 <https://github.com/saltstack-formulas/vault-formula/commit/8b098a3a2729740c25e9204c150e8679ba8546bd>`_\ )

`1.2.2 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.1...v1.2.2>`_ (2019-10-09)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **cert-gen.sh.j2:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/vault-formula/commit/12fd2f9>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** install required packages to bootstrapped ``opensuse`` (\ ` <https://github.com/saltstack-formulas/vault-formula/commit/5f1c3cd>`_\ )
* **kitchen:** use bootstrapped ``opensuse`` images until ``2019.2.2`` (\ ` <https://github.com/saltstack-formulas/vault-formula/commit/c090077>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/vault-formula/commit/ba82312>`_\ )

`1.2.1 <https://github.com/saltstack-formulas/vault-formula/compare/v1.2.0...v1.2.1>`_ (2019-10-01)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **gemfile:** restrict ``inspec`` version to ``~> 4.16.0`` (\ `c82034a <https://github.com/saltstack-formulas/vault-formula/commit/c82034a>`_\ ), closes `/travis-ci.com/saltstack-formulas/vault-formula/jobs/239671364#L2219-L2220 <https://github.com//travis-ci.com/saltstack-formulas/vault-formula/jobs/239671364/issues/L2219-L2220>`_ `/travis-ci.com/saltstack-formulas/vault-formula/jobs/239671365#L1925-L1926 <https://github.com//travis-ci.com/saltstack-formulas/vault-formula/jobs/239671365/issues/L1925-L1926>`_ `/travis-ci.com/saltstack-formulas/vault-formula/jobs/239671366#L1515-L1520 <https://github.com//travis-ci.com/saltstack-formulas/vault-formula/jobs/239671366/issues/L1515-L1520>`_
* **inspec:** fix Ruby lint warnings (\ `9d823ed <https://github.com/saltstack-formulas/vault-formula/commit/9d823ed>`_\ )
* **osfamilymap:** add support for ``Arch`` (\ `b64a589 <https://github.com/saltstack-formulas/vault-formula/commit/b64a589>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* use ``dist: bionic`` & apply ``opensuse-leap-15`` SCP error workaround (\ `d2c97f4 <https://github.com/saltstack-formulas/vault-formula/commit/d2c97f4>`_\ )
* **kitchen:** change ``log_level`` to ``debug`` instead of ``info`` (\ `79b902e <https://github.com/saltstack-formulas/vault-formula/commit/79b902e>`_\ )
* **kitchen+travis:** replace EOL pre-salted images (\ `346cd1e <https://github.com/saltstack-formulas/vault-formula/commit/346cd1e>`_\ )
* **platform:** add ``arch-base-latest`` (\ `6dd656f <https://github.com/saltstack-formulas/vault-formula/commit/6dd656f>`_\ )
* **travis:** apply suggestions from code review (\ `800d842 <https://github.com/saltstack-formulas/vault-formula/commit/800d842>`_\ )
* **travis:** split suites across instances (\ `bfdba0c <https://github.com/saltstack-formulas/vault-formula/commit/bfdba0c>`_\ )
* **travis:** use ``kitchen verify`` instead of ``kitchen test`` (\ `6939af9 <https://github.com/saltstack-formulas/vault-formula/commit/6939af9>`_\ )
* **yamllint:** add rule ``empty-values`` & use new ``yaml-files`` setting (\ `ece89fa <https://github.com/saltstack-formulas/vault-formula/commit/ece89fa>`_\ )

Tests
^^^^^


* **inspec:** move tests to standard ``controls`` sub-directory (\ `bd8649c <https://github.com/saltstack-formulas/vault-formula/commit/bd8649c>`_\ )

`1.2.0 <https://github.com/saltstack-formulas/vault-formula/compare/v1.1.1...v1.2.0>`_ (2019-08-17)
-------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **yamllint:** include for this repo and apply rules throughout (\ `073f66e <https://github.com/saltstack-formulas/vault-formula/commit/073f66e>`_\ )

`1.1.1 <https://github.com/saltstack-formulas/vault-formula/compare/v1.1.0...v1.1.1>`_ (2019-07-13)
-------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **kitchen+inspec:** move inline pillars to files (\ `4dc3025 <https://github.com/saltstack-formulas/vault-formula/commit/4dc3025>`_\ )

`1.1.0 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.6...v1.1.0>`_ (2019-07-10)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **package:** explicitly require package providing setcap (\ `d476700 <https://github.com/saltstack-formulas/vault-formula/commit/d476700>`_\ )
* **user:** handle removal of ``gid_from_name`` in Salt develop branch (\ `dee3748 <https://github.com/saltstack-formulas/vault-formula/commit/dee3748>`_\ ), closes `saltstack/salt#48640 <https://github.com/saltstack/salt/issues/48640>`_

Code Refactoring
^^^^^^^^^^^^^^^^


* **defaults:** place common values in defaults.yaml (\ `3656e31 <https://github.com/saltstack-formulas/vault-formula/commit/3656e31>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** bring into line with ``template-formula`` (\ `34f05bd <https://github.com/saltstack-formulas/vault-formula/commit/34f05bd>`_\ )

Features
^^^^^^^^


* add support for openSUSE (\ `76b8ac3 <https://github.com/saltstack-formulas/vault-formula/commit/76b8ac3>`_\ )

Tests
^^^^^


* **user+group:** test for vault user/group existence (\ `ff5cdf9 <https://github.com/saltstack-formulas/vault-formula/commit/ff5cdf9>`_\ )

`1.0.6 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.5...v1.0.6>`_ (2019-06-24)
-------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* use gpg2 (\ `d755cb4 <https://github.com/saltstack-formulas/vault-formula/commit/d755cb4>`_\ )

`1.0.5 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.4...v1.0.5>`_ (2019-05-15)
-------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **readme:** move requirements section under testing header (\ `dfca3a6 <https://github.com/saltstack-formulas/vault-formula/commit/dfca3a6>`_\ )

`1.0.4 <https://github.com/saltstack-formulas/vault-formula/compare/v1.0.3...v1.0.4>`_ (2019-05-14)
-------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** don't put Gemfile.lock in git (\ `cfd5daf <https://github.com/saltstack-formulas/vault-formula/commit/cfd5daf>`_\ )
* **kitchen:** update Gemfile from template-formula (\ `541ec63 <https://github.com/saltstack-formulas/vault-formula/commit/541ec63>`_\ )
* **travis:** use default bundler on Travis (\ `b9f40b3 <https://github.com/saltstack-formulas/vault-formula/commit/b9f40b3>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** restore requirements section (\ `5f2256c <https://github.com/saltstack-formulas/vault-formula/commit/5f2256c>`_\ )

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
