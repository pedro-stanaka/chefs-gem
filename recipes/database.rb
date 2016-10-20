

include_recipe 'mariadb::server'
include_recipe 'mariadb::client'

directory "/etc/postgresql/#{node['postgresql']['version']}/main" do
  owner 'nobody'
  group 'nogroup'
  mode 0755
  recursive true
  action :create
  only_if { platform?('ubuntu') }
end

if platform?('debian') || (platform?('ubuntu') && node['platform_version'].to_f > 14.04)
  node['chefs_gem']['database']['packages'].each do |pkg|
    package 'Debian MariaDB Client Files' do
      action :install
      package_name pkg
    end
  end
end

# Include after installing client libraries
include_recipe 'mysql2_chef_gem::mariadb'

mysql_connection = {
  username: node['chefs_gem']['database']['username'],
  host: node['chefs_gem']['database']['host'],
  password: (node['chefs_gem']['database']['password'] if platform?('ubuntu') &&
      node['platform_version'].to_f <= 14.04),
  socket: '/var/run/mysqld/mysqld.sock'
}.reject { |_k, v| v.nil? }

mysql_database node['chefs_gem']['database']['dbname'] do
  connection(mysql_connection)
end

mysql_database_user node['chefs_gem']['database']['app']['username'] do
  connection(mysql_connection)
  password node['chefs_gem']['database']['app']['password']
  database_name node['chefs_gem']['database']['dbname']
  host node['chefs_gem']['database']['host']
  action [:create, :grant]
end

## PostgreSQL

include_recipe 'postgresql::client'
include_recipe 'postgresql::server'
include_recipe 'postgresql::config_initdb'
