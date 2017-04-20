{%- set version = salt.pillar.get('vault:vault_version', '0.7.0') %}
{%- set source_hash = salt.pillar.get('vault:source_hash', 'c6d97220e75335f75bd6f603bb23f1f16fe8e2a9d850ba59599b1a0e4d067aaa') %}
install Vault:
  archive.extracted:
    - name: /usr/local/bin
    - source: https://releases.hashicorp.com/vault/{{ version }}/vault_{{ version }}_linux_amd64.zip
    - source_hash: {{ source_hash }}
    - enforce_toplevel: False
