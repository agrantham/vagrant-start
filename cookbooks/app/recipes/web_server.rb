#
# Cookbook Name:: app
# Recipe:: web_server
#
# Copyright 2013, Mathias Hansen
#

# Install Apache
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"

# Install PHP
include_recipe "dotdeb"
include_recipe "dotdeb::php54"
include_recipe "php"

# Install PHP5 packages
node['app']['php_packages'].each do |a_package|
  package a_package
end

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end