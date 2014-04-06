Vagrant Starter
=======================================

## Requirements
* [VirtualBox](https://www.virtualbox.org) or [VMWare Fusion/Workstation](http://www.vmware.com/products/)
	* If using VMWare, you have to purchase and install the [Vagrant VMWare Plugin](http://www.vagrantup.com/vmware)
	* Instructions for the plugin found [here](http://docs.vagrantup.com/v2/vmware/installation.html)
* [Vagrant >= 1.5.0](http://vagrantup.com)

Usage
--------------------------------

1. Clone the repo and its submodules.

```
$ git clone --recursive git@github.com:sevilayha/vagrant-starter
```

2. Add your site files to the `www` folder
3. Start the VM

```
$ vagrant up
```

You can now access your site at 172.90.90.90
.

## Installed software
* Apache 2
* MySQL
* PHP 5.4 (with mysql, curl, mcrypt, memcached, gd)
* memcached
* vim, git, screen, curl, composer

## Default credentials
### MySQL
* Username: root
* Password: password
* Host: localhost
* Port: 3306

**Note:** Remote MySQL access is enabled by default, so you can access the MySQL database using your favorite MySQL client with the above credentials (and using e.g. *projectname.local* as hostname).

### Memcached
* Port: 11211

Credits
---------------------------------
Thanks to [Mathias Hansen](https://github.com/MiniCodeMonkey) and his awesome [Vagrant-LAMP-Stack](https://github.com/MiniCodeMonkey/Vagrant-LAMP-Stack).
