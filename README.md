Vagrant Starter
=======================================

Requirements
--------------------------------
- Virtual Box v4.2.12
- Vagrant v1.2.2
- Omnibus to auto update the Chef version [Vagrant Omnibus] (https://github.com/schisamo/vagrant-omnibus)

```ruby
vagrant plugin install vagrant-omnibus
```

Usage
--------------------------------

1. Clone the repo with all of the cookbooks. `git clone --recursive git@github.com:sevilayha/vagrant-starter`
2. Add your site files to the www folder
3. `vagrant up`

Notes
--------------------------------
The IP Address of your site will be 172.90.90.90 and this can also be used to remotely connect to MySQL Databases.

Credits
---------------------------------
Thanks to [Mathias Hansen](https://github.com/MiniCodeMonkey) and his awesome [Vagrant-LAMP-Stack](https://github.com/MiniCodeMonkey/Vagrant-LAMP-Stack).
