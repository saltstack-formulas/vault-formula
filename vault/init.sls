{% from "vault/map.jinja" import vault with context %}
# using archive.extracted causes: 'Comment: Failed to cache https://releases.hashicorp.com/vault/0.7.0/vault_0.7.0_linux_amd64.zip: [Errno 1] _ssl.c:493: error:1409442E:SSL routines:SSL3_READ_BYTES:tlsv1 alert protocol version'
vault packages:
  pkg.installed:
    - names:
      - unzip
      - curl

download vault:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ vault.version }}/vault_{{ vault.version }}_linux_amd64.zip -o /tmp/vault.zip
    - unless: test -e /tmp/vault.zip

install vault:
  cmd.run:
    - name:  unzip /tmp/vault.zip -d /usr/local/bin &&  chmod 0755 /usr/local/bin/vault &&  chown root:root /usr/local/bin/vault
    - require:
      - cmd: download vault
      - pkg: unzip
    - unless: test -e /usr/local/bin/vault
