{% from "vault/map.jinja" import vault with context %}
{%- if vault.self_signed_cert.enabled %}
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
{% endif -%}

/etc/vault:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/etc/vault/server.hcl:
  file.serialize:
    - dataset_pillar: 'vault:server'
    - user: root
    - group: root
    - mode: 644
    - formatter: json
    - require:
      - file: /etc/vault

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
      {% if vault.self_signed_cert.enabled %}
      - cmd: generate self signed SSL certs
      {% endif -%}
      - file: /etc/vault/server.hcl
