{% from "vault/map.jinja" import vault with context %}
{% if vault.self_signed_cert.enabled %}
/usr/local/bin/self-cert-gen.sh:
  file.managed:
    - source: salt://vault/files/cert-gen.sh.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

generate self signed SSL certs:
  cmd.run:
    - name: bash /usr/local/bin/cert-gen.sh {{ vault.self_signed_cert.hostname }} {{ vault.self_signed_cert.password }}
    - cwd: /etc/vault
    - require:
      - file: /usr/local/bin/self-cert-gen.sh
{% endif %}

/etc/vault/config/server.hcl:
  file.managed:
    - source: salt://vault/files/server.hcl.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/init/vault.conf:
  file.managed:
    - source: salt://vault/files/vault.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

vault:
  service.running:
    - enable: True
    - require:
      {% if vault.self_signed_cert.enabled %}
      - cmd: generate self signed SSL certs
      {% endif %}
      - file: /etc/vault/config/server.hcl
      - file: /etc/init/vault.conf
