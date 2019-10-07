if os[:name] == 'amazon' && os[:release] =~ /^20\d\d/
  log_command = command('cat /var/log/vault.log')
else
  log_command = command('journalctl -u vault')
end

include_controls 'vault-server-baseline'

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

describe log_command do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/Vault server started/) }
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
