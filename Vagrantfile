# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

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
