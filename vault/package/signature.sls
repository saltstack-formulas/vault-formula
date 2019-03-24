# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

vault-package-signature-file-managed-checksum:
  file.managed:
    - name: /opt/vault/{{ vault.version }}_SHA256SUMS
    - source: https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS
    - skip_verify: True
    - makedirs: True

vault-package-signature-file-managed-signature:
  file.managed:
    - name: /opt/vault/{{ vault.version }}_SHA256SUMS.sig
    - source: https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS.sig
    - skip_verify: True
    - makedirs: True

vault-package-signature-cmd-run:
  cmd.run:
    - name: gpg --verify /opt/vault/{{ vault.version }}_SHA256SUMS.sig /opt/vault/{{ vault.version }}_SHA256SUMS
    - onchanges:
      - vault-package-signature-file-managed-checksum
      - vault-package-signature-file-managed-signature
