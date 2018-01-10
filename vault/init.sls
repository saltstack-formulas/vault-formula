{% from "vault/map.jinja" import vault with context %}
# using archive.extracted causes: 'Comment: Failed to cache https://releases.hashicorp.com/vault/0.7.0/vault_0.7.0_linux_amd64.zip: [Errno 1] _ssl.c:493: error:1409442E:SSL routines:SSL3_READ_BYTES:tlsv1 alert protocol version'
vault packages:
  pkg.installed:
    - names:
      - unzip
      - curl
      {% if vault.secure_download %}
      {% if grains['os'] == 'CentOS' or grains['os'] == 'Amazon' %}
      - gnupg2
      - perl-Digest-SHA
      {% elif grains['os'] == 'Ubuntu' %}
      - gnupg
      - libdigest-sha-perl
      {% endif %}
      {% endif %}

download vault:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_linux_amd64.zip -o /tmp/vault_{{ vault.version }}_linux_amd64.zip
    - creates: /tmp/vault_{{ vault.version }}_linux_amd64.zip

{% if vault.secure_download %}
download shasums:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS -o /tmp/vault_{{ vault.version }}_SHA256SUMS
    - creates: /tmp/vault_{{ vault.version }}_SHA256SUMS

download shasums sig:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS.sig -o /tmp/vault_{{ vault.version }}_SHA256SUMS.sig
    - creates: /tmp/vault_{{ vault.version }}_SHA256SUMS.sig

/tmp/hashicorp.asc:
  file.managed:
    - source: salt://vault/files/hashicorp.asc.jinja
    - template: jinja

import key:
  cmd.run:
    - name: gpg --import /tmp/hashicorp.asc
    - unless: gpg --list-keys {{ vault.hashicorp_key_id }}
    - requires:
      - file: /tmp/hashicorp.asc
      - cmd: vault packages

verify shasums sig:
  cmd.run:
    - name: gpg --verify /tmp/vault_{{ vault.version }}_SHA256SUMS.sig /tmp/vault_{{ vault.version }}_SHA256SUMS
    - require:
      - cmd: download shasums
      - cmd: import key

verify vault:
  cmd.run:
    - name: "shasum -a 256 -c vault_{{ vault.version }}_SHA256SUMS | grep -q \"vault_{{ vault.version }}_linux_amd64.zip: OK\""
    - cwd: /tmp
    - require:
      - cmd: download vault
      - cmd: verify shasums sig
{% endif %}

install vault:
  cmd.run:
    - name: unzip /tmp/vault_{{ vault.version }}_linux_amd64.zip -d /usr/local/bin && chmod 0755 /usr/local/bin/vault && chown root:root /usr/local/bin/vault
    - require:
      - cmd: download vault
      - pkg: unzip
      {% if vault.secure_download %}
      - cmd: verify vault
      {% endif %}
    - creates: /usr/local/bin/vault

vault set cap mlock:
  cmd.run:
    - name: "setcap cap_ipc_lock=+ep /usr/local/bin/vault"
    - onchanges:
      - cmd: install vault
