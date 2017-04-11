vault packages:
  pkg.installed:
    - names:
      - jq 
      - unzip

download vault:
  cmd.run:
    - name: curl --silent -L https://releases.hashicorp.com/vault/{{ pillar['pkgs']['vault_version'] }}/vault_{{ pillar['pkgs']['vault_version'] }}_linux_amd64.zip -o /tmp/vault.zip
    - unless: test -e /tmp/vault.zip

install vault:
  cmd.run:
    - name:  unzip /tmp/vault.zip -d /usr/local/bin &&  chmod 0755 /usr/local/bin/vault &&  chown root:root /usr/local/bin/vault
    - require:
      - cmd: download vault
      - pkg: unzip
    - unless: test -e /usr/local/bin/vault
