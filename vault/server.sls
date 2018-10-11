{% from "vault/map.jinja" import vault with context -%}

include:
  - vault

{% if vault.self_signed_cert.enabled -%}
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
    - require_in:
      - service: vault
{% endif -%}

{% if not vault.dev_mode %}
/etc/vault/config:
  file.directory:
    - makedirs: true
    - user: root
    - group: root
    - mode: 755

/etc/vault/config/server.hcl:
  file.managed:
    - source: salt://vault/files/server.hcl.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/vault/config
    - watch_in:
      - service: vault
{% endif %}

{%- if grains.init == 'systemd' %}
/etc/systemd/system/vault.service:
  file.managed:
    - source: salt://vault/files/vault_systemd.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - order: 1
    - watch_in:
      - service: vault
  cmd.run:
    - name: systemctl daemon-reload
    - order: 1
    - onchanges:
      - file: /etc/systemd/system/vault.service

{% elif grains.init == 'upstart' %}
/etc/init/vault.conf:
  file.managed:
    - source: salt://vault/files/vault_upstart.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - order: 1
    - watch_in:
      - service: vault
  cmd.run:
    - name: initctl reload-configuration
    - order: 1
    - onchanges:
      - file: /etc/init/vault.conf
{% endif -%}

vault:
  service.running:
    - enable: true
    - watch:
      - cmd: install vault
