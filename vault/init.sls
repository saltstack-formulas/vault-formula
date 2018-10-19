{% from "vault/map.jinja" import vault with context %}

{% set version = vault.version %}

/opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS:
  file.managed:
    - source: https://releases.hashicorp.com/vault/{{ version }}/vault_{{ version }}_SHA256SUMS
    - makedirs: true
    - skip_verify: true

/opt/vault/{{ version }}/bin:
  archive.extracted:
    - source: https://releases.hashicorp.com/vault/{{ version }}/vault_{{ version }}_linux_amd64.zip
    - source_hash: /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS
    - enforce_toplevel: false
    - require:
      - /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS

/usr/local/bin/vault:
  file.symlink:
    - target: /opt/vault/{{ version }}/bin/vault
    - force: true
    - require:
      - /opt/vault/{{ version }}/bin

{% if vault.secure_download -%}
/opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS.sig:
  file.managed:
    - source: https://releases.hashicorp.com/vault/{{ version }}/vault_{{ version }}_SHA256SUMS.sig
    - skip_verify: true
    - require:
      - /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS


/tmp/hashicorp.asc:
  file.managed:
    - source: salt://vault/files/hashicorp.asc.jinja
    - template: jinja

vault_gpg_pkg:
  pkg.installed:
    - name: {{ vault.gpg_pkg }}

import key:
  cmd.run:
    - name: gpg --import /tmp/hashicorp.asc
    - unless: gpg --list-keys {{ vault.hashicorp_key_id }}
    - require:
      - /tmp/hashicorp.asc
      - vault_gpg_pkg

verify shasums sig:
  cmd.run:
    - name: gpg --verify /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS.sig /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS
    - require:
      - /opt/vault/{{ version }}/vault_{{ version }}_SHA256SUMS.sig
      - import key
    - prereq:
      - /usr/local/bin/vault
{%- endif %}
