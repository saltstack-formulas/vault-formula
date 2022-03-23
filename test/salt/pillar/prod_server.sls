# -*- coding: utf-8 -*-
# vim: ft=yaml
---
vault:
  config:
    storage:
      file:
        path: /var/lib/vault/data
    # `disable_mlock` is only needed for FreeBSD (Vagrant)
    # Doesn't appear to cause a problem for other instances but use an `if`
    # block if it does
    disable_mlock: true
  tls_disable: 1
  self_signed_cert:
    enabled: true
    hostname: localhost
    password: localhost
    country: GB
    state: England
    city: London
    org: example.com
    org_unit: testing
