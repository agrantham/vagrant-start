# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # specify ubuntu 12.04 (precise pangolin)
  
  # box for virtual box
  # config.vm.box      = "precise32"
  # config.vm.box_url  = "http://files.vagrantup.com/precise32.box"
  
  # box for vmware
  config.vm.box      = "precise64"
  config.vm.box_url  = "http://files.vagrantup.com/precise64_vmware.box"

  # set hostonly ip address
  config.vm.network :private_network, ip: "172.90.90.90"

  # increase memory of vm
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 768]
  end

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|

    chef.add_recipe "app::packages"
    chef.add_recipe "app::web_server"
    chef.add_recipe "app::vhost"
    chef.add_recipe "app::db"

    chef.json = {
      :app => {
        # Project name
        :name           => "app",

        # Name of MySQL database that should be created
        :db_name        => "appdb",

        # Server name and alias(es) for Apache vhost
        :server_name    => "app.local",
        :server_aliases => %w{ www.app.local *.app.local },

        # Document root for Apache vhost
        :docroot        => "/vagrant/www",

        # General packages
        :packages   => %w{ git vim screen curl },

        # PHP packages
        :php_packages   => %w{ php5-mysqlnd php5-curl php5-mcrypt php5-gd }
      },

      :mysql => {
        :server_root_password   => 'password',
        :server_repl_password   => 'password',
        :server_debian_password => 'password',
        :bind_address           => '172.90.90.90',
        :allow_remote_root      => true
      },

      :apache => {
        :timeout           => "300",
        :keepalive         => "On",
        :keepaliverequests => "100",
        :keepalivetimeout  => "5"
      }

    }
  end
end