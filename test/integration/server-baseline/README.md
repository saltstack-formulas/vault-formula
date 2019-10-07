# InSpec Profile: `vault-server-baseline`

This shows the implementation of the `vault-server-baseline` InSpec [profile](https://github.com/inspec/inspec/blob/master/docs/profiles.md).

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check vault-server-baseline
Summary
-------
Location: vault-server-baseline
Profile: profile
Controls: 4
Timestamp: 2019-06-24T23:09:01+00:00
Valid: true

Errors
------

Warnings
--------
```

## Execute a profile

To run all **supported** controls on a local machine use `inspec exec /path/to/profile`.

```bash
$ inspec exec vault-server-baseline
..

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
8 examples, 0 failures
```

## Execute a specific control from a profile

To run one control from the profile use `inspec exec /path/to/profile --controls name`.

```bash
$ inspec exec vault-server-baseline --controls package
.

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
1 examples, 0 failures
```

See an [example control here](https://github.com/inspec/inspec/blob/master/examples/profile/controls/example.rb).
