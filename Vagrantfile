# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "coreos"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant.box"

  # Ports
  # ======================================
  config.vm.network "private_network", ip: "172.12.8.150"

  # Expose VM ports to host
  config.vm.network :forwarded_port, :host => 4243, :guest => 4243
  (49000..49900).each do |port|
    config.vm.network :forwarded_port, :host => port, :guest => port
  end

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provider :vmware_fusion do |vb, override|
    override.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant_vmware_fusion.box"
  end

  # NFS setup
  # ======================================
  config.vm.synced_folder "../", "/home/core/share", id: "core", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']

  # Provision
  # ======================================
  config.vm.synced_folder "conf", "/home/core/conf", id: "conf", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']
  config.vm.provision "shell",
    inline: %Q{
        # add service file
        cp /home/core/conf/docker-service.conf /media/state/units/docker-local.service

        # kill service
        sudo systemctl restart local-enable.service
        # restat service
        sudo systemctl restart docker-local.service
    }

  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end
end
