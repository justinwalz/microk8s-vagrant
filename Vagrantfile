# https://app.vagrantup.com/bento/boxes/ubuntu-20.04
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.name = 'microk8s'
  end

  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.provision :shell, path: "#{File.dirname(__FILE__)}/provision.sh"

end
