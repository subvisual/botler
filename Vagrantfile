# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder ".", "/var/www/gb-botler/current"

  config.vm.provision :shell, path: "provision.sh"
end
