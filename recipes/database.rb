#
# Cookbook:: web_server
# Recipe:: database
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Load MySQL passwords from the 'passwords' data bag.
passwords = data_bag_item('passwords', 'mysql')

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password passwords['itumo_root']
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {
  host: '127.0.0.1',
  username: 'root',
  password: passwords['itumo_root']
}

# Create the database instance.
mysql_database node['web_server']['database']['dbname'] do
  connection mysql_connection_info
  action :create
end

# Add a database user.
mysql_database_user node['web_server']['database']['admin_username'] do
  connection mysql_connection_info
  password passwords['itumo_admin']
  database_name node['web_server']['database']['dbname']
  host '127.0.0.1'
  action [:create, :grant]
end
