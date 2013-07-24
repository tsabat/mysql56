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
    # share a tmp folder so that we don't have to re-download the MySQL binary
    # when destroying the VM
    # node.vm.share_folder "vagrant-user-tmp", '/tmp/downloads', './tmp/downloads'
    node.vm.host_name = 'mysql56'
    node.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.add_recipe 'apt'
      chef.add_recipe 'mysql56'
    end
  end

end
