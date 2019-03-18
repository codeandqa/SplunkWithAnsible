# # -*- mode: ruby -*-
# # vi: set ft=ruby :

################# vars ####################
NETWORK_PRIVATE_IP_PREFIX = "192.168.10.5"
UPDATE_YUM = "sudo yum -y update"
VM_BOX_NAME = "bento/centos-7.2"
################# vars ####################

Vagrant.configure("2") do |config|
  
  config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = "3072"
        v.vmx["numvcpus"] = "2"
  end

  config.vm.define "acs" do |acs|
    acs.vm.box =VM_BOX_NAME
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "0"
    acs.vm.provision "shell", inline: UPDATE_YUM
    acs.vm.provision "shell", inline: "sudo yum -y install ansible"
    acs.vm.provision "shell", inline: "sudo yum -y install git"
  end
  
  config.vm.define "splunk" do |splunk|
    splunk.vm.box =VM_BOX_NAME
    splunk.vm.hostname = "splunk"
    splunk.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "1"
    splunk.ssh.password="vagrant"
    splunk.vm.network "forwarded_port", guest: 8000, host: 8000
    splunk.vm.network "forwarded_port", guest: 8089, host: 8089
    splunk.vm.network "forwarded_port", guest: 9997, host: 5050
    splunk.vm.provision "shell", inline: UPDATE_YUM
  end 

  config.vm.define "django" do |django|
    django.vm.box =VM_BOX_NAME
    django.vm.hostname = "django"
    django.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "2"
    django.ssh.password="vagrant"
    django.vm.network "forwarded_port", guest: 8089, host: 8088
    django.vm.network "forwarded_port", guest: 8080, host: 8080
    django.vm.provision "file", source: "AnsibleSetup/data/serverlog.json", destination: "/tmp/serverlog.json"
    django.vm.provision "shell", inline: UPDATE_YUM
  end
end