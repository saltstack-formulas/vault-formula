{% from "vault/map.jinja" import vault with context %}
# using archive.extracted causes: 'Comment: Failed to cache https://releases.hashicorp.com/vault/0.7.0/vault_0.7.0_linux_amd64.zip: [Errno 1] _ssl.c:493: error:1409442E:SSL routines:SSL3_READ_BYTES:tlsv1 alert protocol version'
vault packages:
  pkg.installed:
    - names:
      - unzip
      - curl

download vault:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_linux_amd64.zip -o /tmp/vault_{{ vault.version }}_linux_amd64.zip
    - unless: test -e /tmp/vault_{{ vault.version }}_linux_amd64.zip

download sha256sums vault:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_SHA256SUMS -o /tmp/vault_{{ vault.version }}_SHA256SUMS
    - unless: test -e /tmp/vault_{{ vault.version }}_SHA256SUMS

check sha256sum vault:
  cmd.wait:
    - name: sha256sum -c vault_{{ vault.version }}_SHA256SUMS 2>&1 | grep OK
    - cwd: /tmp
    - watch:
      - cmd: download vault
      - cmd: download sha256sums vault

install vault:
  cmd.run:
    - name:  unzip /tmp/vault_{{ vault.version }}_linux_amd64.zip -d /usr/local/bin &&  chmod 0755 /usr/local/bin/vault &&  chown root:root /usr/local/bin/vault
    - require:
      - cmd: check sha256sum vault
      - pkg: unzip
    - unless: test -e /usr/local/bin/vault
