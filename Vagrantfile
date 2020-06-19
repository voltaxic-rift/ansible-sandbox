# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "1", "--ioapic", "on"]
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end

  config.vm.define "ansible" do | a |
    a.vm.box = "centos/7"
    a.vm.hostname = "ansible"
    a.vm.network "private_network", ip: "172.30.0.10"
    a.vm.provision "shell", path: "provision/ansible.sh"
  end

  (1..2).each do |i|
    config.vm.define "node#{i}" do | n |
      n.vm.box = "centos/7"
      n.vm.hostname = "node#{i}"
      n.vm.network "private_network", ip: "172.30.0.1#{i}"
      n.vm.provision "shell", path: "provision/node.sh"
    end
  end

  config.vm.synced_folder ".", "/ansible", create: true, owner: "vagrant", group: "vagrant"
end