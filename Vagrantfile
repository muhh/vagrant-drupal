# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306


  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "www", "/var/www/docroot", type: "rsync", rsync__exclude: [".git/", "sites/default/files"]
  config.vm.synced_folder "files", "/var/www/docroot/drupal/sites/default/files", owner: "www-data"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.auto_detect = true
  end

  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = :latest
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision "chef_solo" do |chef|
    chef.node_name = "mywebapp"
    chef.cookbooks_path = [ "cookbooks", "vendor/cookbooks" ]
    chef.roles_path = "roles"
    chef.add_role("mywebapp")

    chef.json = {
      :mywebapp => {
        :databases =>  {
          :foo => {
            :username => "foo",
            :password => "bar"
          },
          :drupal => {
            :username => "drupal",
            :password => "rocks"
          }
        }
      }
    }
  end
end
