# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context -%}
{% if not vault.install_from_repo %}
{%   set configfile = vault.config_path ~ '/vault/conf.d/config.json' %}
{% else %}
{%   set configfile = vault.repo_configfile %}
{% endif %}

vault-config-config-file-serialize:
  file.serialize:
    - name: {{ configfile }}
    - encoding: utf-8
    - formatter: json
    - dataset: {{ vault.config | json }}
    - user: root
    - group: vault
    - mode: 640
    - makedirs: True
    - watch_in:
      - service: vault-service-init-service-running
