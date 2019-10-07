if os[:name] == 'amazon' && os[:release] =~ /^20\d\d/
  init_file = '/etc/init/vault.conf'
  log_command = command('cat /var/log/vault.log')
else
  init_file = '/etc/systemd/system/vault.service'
  log_command = command('journalctl -u vault')
end

describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe file(init_file) do
  it { should be_a_file }
end

describe service('vault') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8200) do
  it { should be_listening }
  its('processes') { should include 'vault' }
end

describe http('http://127.0.0.1:8200/v1/sys/seal-status') do
  its('status') { should cmp 200 }
end
