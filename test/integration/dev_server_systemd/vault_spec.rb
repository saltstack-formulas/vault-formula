describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe file('/etc/vault/server.hcl') do
  it { should be_a_file }
  expected = <<-EOF
{
  "default_lease_ttl": "24h",
  "listener": [
    {
      "tcp": {
        "address": "0.0.0.0:8200",
        "tls_disable": true
      }
    }
  ],
  "max_lease_ttl": "24h",
  "storage": {
    "file": {
      "path": "/tmp/vault"
    }
  }
}
EOF
  its(:content) { should eq(expected) }
end

describe file('/etc/systemd/system/vault.service') do
  it { should be_a_file }
  its(:content) { should_not match /syslog/ }
end

describe file('/etc/init/vault.conf') do
  it { should_not be_a_file }
end

describe service('vault') do
  it { should be_enabled }
  it { should be_running }
end

describe command('journalctl -u vault') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/WARNING: Dev mode is enabled!/) }
end
