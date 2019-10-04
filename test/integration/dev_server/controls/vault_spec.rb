if os[:name] == 'amazon' && os[:release] =~ /^20\d\d/
  log_command = command('cat /var/log/vault.log')
else
  log_command = command('journalctl -u vault')
end

include_controls 'vault-server-baseline'

describe file("/etc/vault/conf.d/config.json") do
  it { should_not be_a_file }
end

describe log_command do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/WARNING! dev mode is enabled!/) }
end

describe json(content: http('http://127.0.0.1:8200/v1/sys/seal-status').body) do
    its('initialized') { should eq true }
    its('sealed') { should eq false }
end
