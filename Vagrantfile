# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  boxes = [
    { :name => "mysql",             :ip => "192.168.50.10", :memory => 512 },
    { :name => "lumis1",            :ip => "192.168.50.11", :memory => 1024 },
    { :name => "lumis2",            :ip => "192.168.50.12", :memory => 1024 }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]
      config.vm.provision "shell", inline: "sudo setenforce 0"
      
      config.vm.provider :virtualbox do |v|
        v.memory = opts[:memory]
        v.cpus = 1
        v.linked_clone = true
      end
    end
  end
end
