# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

vault-package-clean-file-absent:
  file.absent:
    - name: /opt/vault

vault-package-clean-file-absent-data:
  file.absent:
    - name: /var/lib/vault

vault-package-clean-cmd-run:
  cmd.run:
    - name: gpg --batch --yes --delete-key {{ vault.hashicorp_key_id }}

vault-package-clean-user-absent:
  user.absent:
    - name: vault

vault-package-clean-group-absent:
  group.absent:
    - name: vault
