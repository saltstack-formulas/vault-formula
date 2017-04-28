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

{%- if vault.dev_mode %}
/etc/vault/config:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /etc/vault

/etc/vault/config/server.hcl:
  file.managed:
    - source: salt://vault/files/server.hcl.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/vault/config
{% endif -%}

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
{%- if vault.self_signed_cert.enabled or  vault.dev_mode %}
    - require:
      {%- if vault.self_signed_cert.enabled %}
      - cmd: generate self signed SSL certs
      {% endif -%}
      {%- if vault.dev_mode %}
      - file: /etc/vault/config/server.hcl
      {% endif -%}
{% endif -%}
