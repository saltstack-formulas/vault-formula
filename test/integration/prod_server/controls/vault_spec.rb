# frozen_string_literal: true

config_json, service_cmd, path_to_etc_vault =
  case system.platform[:family]
  when 'bsd'
    %w[/usr/local/etc/vault/conf.d/config.json
       service\ vault\ status
       /usr/local/etc/vault]
  else
    %w[/etc/vault/conf.d/config.json
       journalctl\ -u\ vault
       /etc/vault]
  end

describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  # https://rubular.com/r/vVeCVuHAmtTYt3
  its(:stdout) { should match(/^Vault v[0-9.]+ \('[0-9a-f]+'\)/) }
end

control 'TODO: ...' do
  title 'TODO: ...'

  only_if('`getcap` not available on FreeBSD') do
    !%w[freebsd].include?(system.platform[:name])
  end

  describe command('getcap $(readlink -f /usr/local/bin/vault)') do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should be_empty }
    # https://rubular.com/r/JApIMY1oNqGRZ8
    its(:stdout) { should match(%r{/vault\s?=? cap_ipc_lock[+=]ep$}) }
  end
end

describe user('vault') do
  it { should exist }
  its('group') { should eq 'vault' }
end

describe file(config_json) do
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

  describe file('/usr/local/etc/rc.d/vault') do
    it { should be_a_file }
  end
end

describe service('vault') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe.one do
  describe command(service_cmd) do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should be_empty }
    its(:stdout) { should match(/Vault server started|vault is running as pid \d+/) }
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

describe file("#{path_to_etc_vault}/localhost.pem") do
  it { should be_a_file }
end

describe file("#{path_to_etc_vault}/localhost-nopass.key") do
  it { should be_a_file }
end
