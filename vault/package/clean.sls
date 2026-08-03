# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

{% if not vault.install_from_repo %}
include:
  - .gpg.clean

vault-package-clean-file-absent:
  file.absent:
    - name: /opt/vault

vault-package-clean-file-absent-data:
  file.absent:
    - name: /var/lib/vault

vault-package-clean-file-absent-link:
  file.absent:
    - name: /usr/local/bin/vault

vault-package-clean-user-absent:
  user.absent:
    - name: vault

vault-package-clean-group-absent:
  group.absent:
    - name: vault
{% else %}
vault-package-clean-pkg:
  pkg.removed:
  - name: {{ vault.package }}

valut-package-clean-repository:
  pkgrepo.absent:
  - name: {{ vault.repo }}
{% endif %}
