# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

vault-package-gpg-file-managed:
  file.managed:
    - name: /opt/vault/hashicorp.asc
    - contents: |
        {{ vault.hashicorp_gpg_key | indent(8) }}
    - makedirs: True

vault-package-gpg-pkg-installed:
  pkg.installed:
    - name: {{ vault.gpg_pkg }}

vault-package-gpg-cmd-run:
  cmd.run:
    - name: gpg --import /opt/vault/hashicorp.asc
    - unless: gpg --list-keys {{ vault.hashicorp_key_id }}
