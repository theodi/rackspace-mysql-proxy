require 'serverspec'
set :backend, :exec

describe service('mysql') do
  it { should be_running }
end

describe command('mysql -h localhost -u root -pilikerandompasswords -e "show databases"') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /Database/}
end

describe command('mysql -h localhost -u certificate -pthisisafakepassword certificate -e "show tables"') do
  its(:exit_status) { should eq 0 }
end
