
# Install misc packages
node['misc']['packages'].each do |a_package|
  package a_package
end

# Disable default vhost config
execute "disable-default-site" do
  command "a2dissite default"
end

# Enable vhost
web_app "server" do
  server_name node['hostname']
  application_name "server-app"
  docroot node['misc']['docroot']
  log_dir node['apache']['log_dir'] 
end

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end

# Let MySQL root user have access from any host
execute "update-root-mysql-user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '#{node[:mysql][:server_root_password]}' WITH GRANT OPTION;" +
      "FLUSH PRIVILEGES;\" " +
      "mysql"
  action :run
  ignore_failure true
end

# Create database if it doesn't exist
ruby_block "create_#{node['misc']['name']}_db" do
    block do
        %x[mysql -uroot -p#{node[:mysql][:server_root_password]} -e "CREATE DATABASE #{node[:misc][:db_name]};"]
    end 
    not_if "mysql -uroot -p#{node[:mysql][:server_root_password]} -e \"SHOW DATABASES LIKE '#{node[:misc][:db_name]}'\" | grep #{node[:misc][:db_name]}";
    action :create
end