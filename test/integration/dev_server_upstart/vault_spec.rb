describe file('/etc/vault/config/server.hcl') do
  it { should be_a_file }
  expected = <<-EOF
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 0

}

default_lease_ttl="24h"
max_lease_ttl="24h"
EOF
  its(:content) { should eq(expected) }
end

describe file('/etc/systemd/system/vault.service') do
  it { should_not be_a_file }
end

describe file('/etc/init/vault.conf') do
  it { should be_a_file }
  its(:content) { should_not match /syslog/ }
end

if os[:family] == 'amazon'
  # serverspec assumes 'service' resource to be
  # init.d for rhel-based os. have to just check
  # that it is running, that means that it started
  # with the instance
  describe command('sudo initctl list | grep vault | grep -v grep') do
    its(:stdout) { should match(/vault start\/running/) }
    its(:stderr) { should be_empty }
  end

  describe processes("vault") do
    its('users') { should eq ['root'] }
  end

else
  describe service('vault') do
    it { should be_enabled }
    it { should be_running }
  end
end

describe file('/var/log/vault.log') do
  it { should be_a_file }
  its(:content) { should match(/WARNING: Dev mode is enabled!/) }
end

