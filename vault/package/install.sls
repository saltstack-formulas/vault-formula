# -*- coding: utf-8 -*-
# vim: ft=sls syntax=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

{% from "vault/map.jinja" import vault with context %}

vault-package-install-group-present:
  group.present:
    - name: vault
    - system: True

vault-package-install-user-present:
  user.present:
    - name: vault
    - system: True
    - gid: vault
    - home: /var/lib/vault
    - require:
      - group: vault-package-install-group-present

vault-package-install-file-directory:
  file.directory:
    - name: /opt/vault/bin
    - makedirs: True

vault-package-install-file-managed:
  file.managed:
    - name: /opt/vault/{{ vault.version }}_SHA256SUMS
    - source: https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS
    - skip_verify: True
    - makedirs: True

vault-package-install-service-dead:
  service.dead:
    - name: vault
    - onchanges:
      - file: vault-package-install-file-managed
    - onlyif: test -f /etc/systemd/system/vault.service

vault-package-install-archive-extracted:
  archive.extracted:
    - name: /opt/vault/bin
    - source: https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_{{ vault.platform }}.zip
    - source_hash: https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS
    - source_hash_name: vault_{{ vault.version }}_{{ vault.platform }}.zip
    - enforce_toplevel: False
    - overwrite: True
    - onchanges:
      - file: vault-package-install-file-managed

vault-package-install-file-symlink:
  file.symlink:
    - name: /usr/local/bin/vault
    - target: /opt/vault/bin/vault
    - force: true

{% if grains['os_family'] != "FreeBSD" %}
vault-package-install-pkg-installed:
  pkg.installed:
    - name: {{ vault.setcap_pkg }}

vault-package-install-cmd-run:
  cmd.run:
    - name: setcap cap_ipc_lock=+ep /opt/vault/bin/vault
    - require:
      - pkg: vault-package-install-pkg-installed
    - onchanges:
      - archive: vault-package-install-archive-extracted
{% else %}
vault-package-install-login-file:
  file.replace:
    - name: /etc/login.conf
    - pattern: |
        ^daemon:\\(?:\n|\r\n?)(.+)$(?:\n|\r\n?)^(\t):tc=default:
    - flags: ['MULTILINE']
    - repl: |
        daemon:\\
        \t:memorylocked=256M:\\
        \t:tc=default:

vault-package-install-cmd-run:
  cmd.run:
    - name: cap_mkdb /etc/login.conf
    - watch:
      - file: vault-package-install-login-file
{% endif %}
