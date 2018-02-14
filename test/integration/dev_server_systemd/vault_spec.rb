describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe file('/etc/vault/config/server.json') do
  it { should be_a_file }
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
  # Be aware the test below will likely fail if your host OS
  # has SELinux set to Enforcing as that will traverse into the conainer and deny
  # the vault user which doesn't have the privilege to write as systemd to the
  # journal.
  # On distributions like Fedora, this should be tested with vagrant-virtualbox
  # or vagrant-libvirt
  its(:stdout) { should match(/WARNING: Dev mode is enabled!/) }
end
