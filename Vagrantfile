# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<-SCRIPT
sudo useradd -m ansible
echo "ansible:P@ssWord123" | sudo chpasswd
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo echo "%ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible
SCRIPT

$script_dns_server = <<-SCRIPT
sudo echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8\n" >> /etc/resolv.conf
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
  config.vm.provision "shell", inline: $script_dns_server
  
  config.vm.define "ansible_controller" do |ansible_controller|
    ansible_controller.vm.box = "centos/7"
    ansible_controller.vm.network "private_network", ip: "192.168.33.11"
    ansible_controller.vm.hostname = "ansible-controller"
    ansible_controller.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end
  config.vm.define "centos1" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.network "private_network", ip: "192.168.33.12"
    centos.vm.hostname = "centos1"
    centos.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end
  config.vm.define "centos2" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.network "private_network", ip: "192.168.33.13"
    centos.vm.hostname = "centos2"
    centos.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end
end