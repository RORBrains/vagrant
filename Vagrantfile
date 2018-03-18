Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.100.101"

  config.vm.provider "virtualbox" do |v|
    v.name = "rails-tutorial"
    v.memory = 2048
    v.cpus = 2
  end
end

