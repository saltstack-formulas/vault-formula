# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

{% if not vault.install_from_repo %}
vault-service-init-file-managed:
  file.managed:
    - name: {{ vault.service.path }}
    - source: {{ vault.service.source }}
    - template: jinja
{% if grains.os_family == "FreeBSD" %}
    - mode: 555
{% endif %}
    - watch_in:
      - service: vault-service-init-service-running
{% if grains.get('init', '') == 'upstart' %}
  cmd.run:
    - name: initctl reload-configuration
    - onchanges:
      - file: vault-service-init-file-managed
{% endif -%}
{% endif %}

vault-service-init-service-running:
  service.running:
    - name: vault
    - enable: True
    - watch:
{% if not vault.install_from_repo %}
      - archive: vault-package-install-archive-extracted
      - file: vault-service-init-file-managed
{% else %}
      - pkg: vault-package-installed
{% endif %}
