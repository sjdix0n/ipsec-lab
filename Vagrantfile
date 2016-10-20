# -*- mode: ruby -*-
# vi: set ft=ruby :

$enable_serial_logging = false

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|



 config.vm.define "cpe1" do |cpe1|
    cpe1.vm.box = "juniper/ffp-12.1X47-D20.7"
    cpe1.vm.network :forwarded_port, guest: 22, host: 12203, id: 'ssh'
    cpe1.vm.network "private_network", virtualbox__intnet: "internet", ip: "10.0.0.1", netmask: "255.255.255.0"
    cpe1.vm.network "private_network", virtualbox__intnet: "cpe1-site1", ip: "192.168.1.1", netmask: "255.255.255.0"
    cpe1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end

#config.vm.define "cpe2" do |cpe2|
#    cpe2.vm.box = "iosxe"
#    cpe2.vm.network "private_network", virtualbox__intnet: "internet", auto_config: false 
#    cpe2.vm.network "private_network", virtualbox__intnet: "cpe2-site2", auto_config: false 
#  end

 config.vm.define :cpe3 do |cpe3|
    cpe3.vm.box = "higebu/vyos-1.1.7-amd64"
    cpe3.vm.network "private_network", virtualbox__intnet: "internet", ip: "10.0.0.3", netmask: "255.255.255.0"
    cpe3.vm.network "private_network", virtualbox__intnet: "cpe3-site3", ip: "192.168.3.1", netmask: "255.255.255.0"
    cpe3.vm.synced_folder ".", "/vagrant", disabled: true
  end

 config.vm.define "site1" do |site1|
   site1.vm.box = "boxcutter/ubuntu1404"
   site1.vm.hostname = "site1"
   site1.vm.network "private_network", virtualbox__intnet: "cpe1-site1", ip: "192.168.1.10", netmask: "255.255.255.0"
 end


#config.vm.define "site2" do |site2|
#   site2.vm.box = "boxcutter/ubuntu1404"
#   site2.vm.hostname = "site2"
#   site2.vm.network "private_network", virtualbox__intnet: "cpe2-site2", ip: "192.168.2.10", netmask: "255.255.255.0"
# end

config.vm.define "site3" do |site3|
   site3.vm.box = "boxcutter/ubuntu1404"
   site3.vm.hostname = "site3"
   site3.vm.network "private_network", virtualbox__intnet: "cpe3-site3", ip: "192.168.3.10", netmask: "255.255.255.0"
 end


  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook/empty_playbook.yml"
#    ansible.playbook = "playbook/vyos.yml"
#    ansible.groups = {
#      "vyos" => ["cpe3"]
#    }
    ansible.verbose = "v"
  end
end
