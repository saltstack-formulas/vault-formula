describe file('/usr/local/bin/vault') do
  it { should be_a_file }
  it { should be_executable }
end

describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v1.1.0 \('36aa8c8dd1936e10ebd7a4c1d412ae0e6f7900bd'\)/) }
end

describe service('vault') do
  it { should_not be_installed }
  it { should_not be_enabled }
  it { should_not be_running }
end

describe file("/etc/vault/conf.d/config.json") do
  it { should_not be_a_file }
end
