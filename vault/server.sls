#TODO only do this if bool param 'self_signed_cert: true'
/usr/local/bin/self-cert-gen.sh:
  file.managed:
    - source: salt://vault/templates/cert-gen.sh.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

#TODO only do this if bool param 'self_signed_cert: true'
#TODO parameterize localhost and 'vault' password
generate SSL certs:
  cmd.run:
    - name: bash /usr/local/bin/cert-gen.sh localhost vault
    - cwd: /etc/vault
    - require:
      - file: /usr/local/bin/self-cert-gen.sh

/etc/vault/config/server.hcl:
  file.managed:
    - source: salt://vault/templates/server.hcl.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/init/vault.conf:
  file.managed:
    - source: salt://vault/templates/vault.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

vault:
  service.running:
    - enable: True
    - require:
      - cmd: generate SSL certs #todo only if bool present
      - file: /etc/vault/config/server.hcl
      - file: /etc/init/vault.conf
