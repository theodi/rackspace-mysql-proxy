include_recipe "mysql::server"
include_recipe "database::mysql"

cnxn_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => 'ilikerandompasswords'
}

mysql_database 'certificate' do
  connection cnxn_info
  action :create
end

mysql_database_user 'certificate' do
  connection    cnxn_info
  password      'thisisafakepassword'
  database_name 'certificate'
  host          '%'
  privileges    [:all]
  action        :grant
end
