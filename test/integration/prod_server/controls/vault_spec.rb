describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe command('getcap $(readlink -f /usr/local/bin/vault)') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/\/vault = cap_ipc_lock\+ep$/) }
end

describe user('vault') do
  it { should exist }
  its('group') { should eq 'vault' }
end

describe file('/etc/vault/conf.d/config.json') do
  it { should be_a_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'vault' }
  its('mode') { should cmp '0640' }
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

describe.one do
  describe command('journalctl -u vault') do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should be_empty }
    its(:stdout) { should match(/Vault server started/) }
  end

  describe file('/var/log/vault.log') do
    it { should be_a_file }
    its(:content) { should match(/Vault server started/) }
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
    its('initialized') { should eq false }
    its('sealed') { should eq true }
end

describe file('/etc/vault/localhost.pem') do
  it { should be_a_file }
end

describe file('/etc/vault/localhost-nopass.key') do
  it { should be_a_file }
end
