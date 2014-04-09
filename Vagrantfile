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

  # provision using chef
  config.vm.provision :chef_solo do |chef|
    
      # config.omnibus.chef_version = :latest
      
      chef.add_recipe "apt"
      chef.add_recipe "openssl"
      
      chef.add_recipe "apache2"
      chef.add_recipe "apache2::mod_php5"
      chef.add_recipe "apache2::mod_rewrite"
      
      chef.add_recipe "mysql::server"
      
      chef.add_recipe "dotdeb"
      chef.add_recipe "dotdeb::php54"
      chef.add_recipe "php"
      
      chef.add_recipe "misc"

      chef.json = {

        :misc   => {
          :docroot    => "/vagrant/www",
          :name       => "server",
          
          # Server name and alias(es) for Apache vhost
          :server_name    => "app.dev",
          :server_aliases => "*.app.dev",
        
          :db_name    => "appdb",
          :packages   => [ "git", "vim", "curl", "php5-mysqlnd", "php5-curl", "php5-mcrypt" ]
        },

        :mysql  => {
          :server_root_password   => "password",
          :server_repl_password   => "password",
          :server_debian_password => "password",
          :bind_address           => "172.90.90.90",
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
