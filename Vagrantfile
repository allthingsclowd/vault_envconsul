Vagrant.configure("2") do |config|

    #override global variables to fit Vagrant setup
    ENV['LEADER_NAME']||="leader01"
    ENV['LEADER_IP']||="192.168.2.11"
    
    #global config
    config.vm.synced_folder ".", "/vagrant"
    config.vm.synced_folder ".", "/usr/local/bootstrap"
    config.vm.box = "allthingscloud/go-counter-demo"
    config.vm.provision "shell", path: "scripts/install_consul.sh", run: "always"
    config.vm.provision "shell", path: "scripts/install_vault.sh", run: "always"

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
    end

    config.vm.define "leader01" do |leader01|
        leader01.vm.hostname = ENV['LEADER_NAME']
        leader01.vm.network "private_network", ip: ENV['LEADER_IP']
        leader01.vm.provision "shell", path: "scripts/install_test_scripts.sh", run: "always"
        leader01.vm.network "forwarded_port", guest: 8500, host: 8500
        leader01.vm.network "forwarded_port", guest: 8200, host: 8200
    end

end
