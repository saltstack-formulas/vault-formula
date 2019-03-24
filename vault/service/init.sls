# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

vault-service-init-file-managed:
  file.managed:
    - name: {{ vault.service.path }}
    - source: {{ vault.service.source }}
    - template: jinja

vault-service-init-service-running:
  service.running:
    - name: vault
    - enable: true
    - watch:
      - vault-package-install-archive-extracted
      - vault-service-init-file-managed
