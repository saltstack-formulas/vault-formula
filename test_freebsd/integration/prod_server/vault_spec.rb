describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v[0-9\.]+ \('[0-9a-f]+'\)/) }
end

describe file('/usr/local/etc/vault/conf.d/config.json') do
  it { should be_a_file }
end

describe service('vault') do
  it { should be_enabled }
  it { should be_running }
end

describe.one do
  describe command('service vault status') do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should be_empty }
    its(:stdout) { should match /vault is running/ }
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

describe file('/usr/local/etc/vault/localhost.pem') do
  it { should be_a_file }
end

describe file('/usr/local/etc/vault/localhost-nopass.key') do
  it { should be_a_file }
end
