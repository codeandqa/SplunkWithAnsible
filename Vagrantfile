# # -*- mode: ruby -*-
# # vi: set ft=ruby :
Vagrant.configure("2") do |config|
  
  config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = "3072"
        v.vmx["numvcpus"] = "2"
  end

  config.vm.define "acs" do |acs|
    acs.vm.box ="bento/centos-7.2"
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: "192.168.10.50"
    acs.vm.provision "shell", inline: "sudo yum -y update"
    acs.vm.provision "shell", inline: "sudo yum -y install ansible"
    acs.vm.provision "shell", inline: "sudo yum -y install git unzip"
  end
  
  config.vm.define "splunk" do |splunk|
    splunk.vm.box ="bento/centos-7.2"
    splunk.vm.hostname = "splunk"
    splunk.vm.network "private_network", ip: "192.168.10.51"
    splunk.ssh.password="vagrant"
    splunk.vm.network "forwarded_port", guest: 8000, host: 8000
    splunk.vm.network "forwarded_port", guest: 8089, host: 8089
    splunk.vm.network "forwarded_port", guest: 9997, host: 5050
    splunk.vm.provision "shell", inline: "sudo yum -y update"
    splunk.vm.provision "shell", inline: "sudo yum -y install git unzip"

  end 

  config.vm.define "django" do |django|
    django.vm.box ="bento/centos-7.2"
    django.vm.hostname = "django"
    django.vm.network "private_network", ip: "192.168.10.52"
    django.ssh.password="vagrant"
    django.vm.network "forwarded_port", guest: 8089, host: 8088
    django.vm.network "forwarded_port", guest: 8080, host: 8080
    django.vm.provision "file", source: "AnsibleSetup/data/serverlog.json", destination: "/tmp/serverlog.json"
    django.vm.provision "shell", inline: "sudo yum -y update"
    django.vm.provision "shell", inline: "sudo yum -y install git unzip"
  end

  
end

# wget -O splunk-6.6.1-aeae3fe0c5af-linux-2.6-x86_64.rpm 'https://www.splunk.com/page/download_track?file=6.6.1/linux/splunk-6.6.1-aeae3fe0c5af-linux-2.6-x86_64.rpm&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=6.6.1&product=splunk&typed=release'
# django.vm.provision "shell", inline: "sudo yum -y install yum-utils"
# django.vm.provision "shell", inline: "sudo yum -y groupinstall development"
# django.vm.provision "shell", inline: "sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm"
# django.vm.provision "shell", inline: "sudo yum -y install python36u"
# django.vm.provision "shell", inline: "sudo yum -y install python36u-pip"
# django.vm.provision "shell", inline: "sudo yum -y install python36u-devel"