# frozen_string_literal: true

describe file('/usr/local/bin/vault') do
  it { should be_a_file }
  it { should be_executable }
end

describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) do
    should match(/^Vault v1.12.0 \(558abfa75702b5dab4c98e86b802fb9aef43b0eb\)/)
  end
end

describe service('vault') do
  it { should_not be_installed }
  it { should_not be_enabled }
  it { should_not be_running }
end

describe file('/etc/vault/conf.d/config.json') do
  it { should_not be_a_file }
end
