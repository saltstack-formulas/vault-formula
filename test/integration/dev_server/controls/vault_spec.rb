describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe.one do
  describe file('/etc/systemd/system/vault.service') do
    it { should be_a_file }
    its(:content) { should_not match(/syslog/) }
  end

  describe file('/etc/init/vault.conf') do
    it { should be_a_file }
  end
end

describe service('vault') do
  it { should be_enabled }
  it { should be_running }
end

describe file("/etc/vault/conf.d/config.json") do
  it { should_not be_a_file }
end

describe.one do
  describe command('journalctl -u vault') do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should be_empty }
    its(:stdout) { should match(/WARNING! dev mode is enabled!/) }
  end

  describe file('/var/log/vault.log') do
    it { should be_a_file }
    its(:content) { should match(/WARNING! dev mode is enabled!/) }
  end
end

describe port(8200) do
  it { should be_listening }
  its('processes') { should include 'vault' }
end

describe http('http://127.0.0.1:8200/v1/sys/seal-status') do
  its('status') { should cmp 200 }
end

describe json(content: http('http://127.0.0.1:8200/v1/sys/seal-status').body) do
    its('initialized') { should eq true }
    its('sealed') { should eq false }
end
