vault:
  config:
    storage:
      file:
        path: /var/lib/vault/data
  tls_disable: 1
  self_signed_cert:
    enabled: True
    hostname: localhost
    password: localhost
    country: GB
    state: England
    city: London
    org: example.com
    org_unit: testing
