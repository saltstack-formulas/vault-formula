{% from "vault/map.jinja" import vault with context %}
{%- if vault.self_signed_cert.enabled %}
/tmp/self-cert-gen.sh:
  file.managed:
    - source: salt://vault/files/self-cert-gen.sh.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

generate self signed SSL certs:
  cmd.run:
    - name: bash /tmp/self-cert-gen.sh {{ vault.self_signed_cert.hostname }} {{ vault.self_signed_cert.password }}
    - require:
      - file: /tmp/self-cert-gen.sh
{% endif -%}

/etc/vault:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/etc/vault/config:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /etc/vault

/etc/vault/config/server.json:
  file.managed:
    - source: salt://vault/files/server.json.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/vault/config

{%- if vault.service.type == 'systemd' %}
/etc/systemd/system/vault.service:
  file.managed:
    - source: salt://vault/files/vault_systemd.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - service: vault

{% elif vault.service.type == 'upstart' %}
/etc/init/vault.conf:
  file.managed:
    - source: salt://vault/files/vault_upstart.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - require_in:
      - service: vault
{% endif -%}

vault:
  service.running:
    - enable: True
    - require:
      {%- if vault.self_signed_cert.enabled %}
      - cmd: generate self signed SSL certs
      {% endif %}
      - file: /etc/vault/config/server.json
      - cmd: install vault
    - onchanges:
      - cmd: install vault
      - file: /etc/vault/config/server.json
