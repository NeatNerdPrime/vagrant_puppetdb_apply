# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

  config.hostmanager.enabled           = true
  config.hostmanager.manage_host       = true
  config.hostmanager.manage_guest      = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline   = true

  config.vm.define "client" do |client|
    client.vm.box      = "puppetlabs/CentOS-7.2-x86_64-libvirt-aio"
    client.vm.hostname = "client.koewacht.net"
    client.vm.provider :libvirt do |dom6|
      dom6.memory = 1024
      dom6.cpus   = 1
    end
  end

  config.vm.define "puppetdb" do |puppetdb|
    puppetdb.vm.box      = "puppetlabs/CentOS-7.2-x86_64-libvirt-aio"
    puppetdb.vm.hostname = "puppetdb.koewacht.net"
    puppetdb.hostmanager.aliases = %w(puppetdb)
    puppetdb.vm.provider :libvirt do |dom6|
      dom6.memory = 8192
      dom6.cpus   = 1
    end
  end
end
