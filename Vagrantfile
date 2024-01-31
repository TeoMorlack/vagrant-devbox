# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-22.04"

    config.vm.define "devbox"
    config.vm.provider :virtualbox do |vb|
        vb.name = "devbox"
        vb.memory = 4096
        vb.cpus = 4
        if Vagrant::Util::Platform.windows? then
            # Fix for slow external network connections for Windows 10
            vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
            vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
            vb.gui = true
        end
    end

    # config.vm.synced_folder "local/", "/remote", disabled: false

    # when using private network all ports are auto forwarded
    # config.vm.network "private_network", ip: "192.168.50.50"

    #specific forwarded ports for localhost, guest is devbox, host is local
    # config.vm.network "forwarded_port", guest: 5000, host: 5000, auto_correct: true
    # config.vm.network "forwarded_port", guest: 8080, host: 8081, auto_correct: true

    config.vm.provision "shell", path: "provisioners/shell/setup_system.sh", privileged: false
    config.vm.provision "shell", path: "provisioners/shell/setup_python.sh", privileged: false

    # alternate provisioner, use with --provision-with ansible_local
    config.vm.provision "ansible_local", run: "never" do |ansible|
        ansible.playbook = "provisioners/ansible/playbook.yml"
    end

end