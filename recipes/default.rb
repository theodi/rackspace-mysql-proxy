include_recipe "mysql::server"
include_recipe "database::mysql"

cnxn_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => 'ilikerandompasswords'
}

mysql_database node['rackspace-mysql-proxy']['database'] do
  connection cnxn_info
  action :create
end

mysql_database_user node['rackspace-mysql-proxy']['user'] do
  connection    cnxn_info
  password      node['rackspace-mysql-proxy']['password']
  database_name node['rackspace-mysql-proxy']['database']
  host          '%'
  privileges    [:all]
  action        :grant
end
