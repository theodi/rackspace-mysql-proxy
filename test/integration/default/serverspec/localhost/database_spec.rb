require 'spec_helper'

describe service('mysql') do
  it { should be_running }
end

describe command('mysql -h localhost -u root -pilikerandompasswords -e "show databases"') do
  it { should return_exit_status 0 }
  it { should return_stdout /Database/}
end

describe command('mysql -h localhost -u certificate -pthisisafakepassword certificate -e "show tables"') do
  it { should return_exit_status 0 }
end
