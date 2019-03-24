# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

vault-service-clean-service-dead:
  service.dead:
    - name: vault
    - enable: False

vault-service-clean-file-absent:
  file.absent:
    - name: /etc/systemd/system/vault.service
