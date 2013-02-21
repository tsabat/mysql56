# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.define :mysql56_playground do |node|
    node.vm.box = 'precise64'
    node.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    node.vm.host_name = 'mysql56'
    node.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.add_recipe 'apt'
      chef.add_recipe 'mysql56'
    end
  end

  # sudo apt-get install mysql-server-5.5 mysql-client-5.5 <-- how to do password?
  # wget http://www.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.10-debian6.0-x86_64.deb/from/http://cdn.mysql.com/ -O mysql-5.6.10-debian6.0-x86_64.deb
  # dpkg -i mysql-5.6.10-debian6.0-x86_64.deb
  # rm mysql-5.6.10-debian6.0-x86_64.deb
  # mv /etc/mysql/my.cnf /etc/my.cnf
  # cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql.server
  # update-rc.d mysql.server defaults
  # chown -R mysql /opt/mysql/server-5.6/
  # chgrp -R mysql /opt/mysql/server-5.6/

  # template my.cnf

  # service mysql stop
  # /opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql
  # rm /opt/mysql/server-5.6/my.cnf

  # permissions on /var/lib/mysql
  # permissions on auto.cnf
  # chown mysql:mysql /var/lib/mysql/auto.cnf

  # template file - /etc/profile.d/mysql56
end
