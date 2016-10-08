# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|


  # This refers to the Vagrant box you would like to base yours on, in this case Ubuntu

  config.vm.box = "ubuntu/trusty64"

  # This refers to the hostname of the box - usually something relevant to your project
  # In order to use this hostname, it must be pointed to the VM's private IP in your
  # system's hosts file.

  config.vm.hostname = "inprojectvagrant.dev"

  # This message will output in the console after the Vagrant box is up and running

  config.vm.post_up_message = "The VM is now running! Type vagrant ssh to manage this box."

  # This is the private IP with which you'll access your box. It may only be accessed locally

  config.vm.network "private_network", ip: "192.168.32.10"

  # The vm synced folder is the location inside of the vagrant box where your project files
  # will be found.

  # The settings below apply permissions to files in the web directory that will allow
  # them to be successfully run by the web server

  config.vm.synced_folder ".", "/home/vagrant/inprojectvagrant",
    :owner => "vagrant",
    :group => "www-data",
    :mount_options => ["dmode=775","fmode=664"]

  # Choose Virtualbox as the provider and allocate 1 GB of memory

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
   end


module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end

    # Here we will include our shell scripts for installing packages in the newly-created
    # VM. Also demonstrated here is the ability to include separate shell scripts
    # for users with different operating systems.

    config.vm.provision "shell", path: "vagrant/dev-install.sh"
if OS.windows?
    config.vm.provision "shell", path: "vagrant/dev-install-windows.sh"
else
    config.vm.provision "shell", path: "vagrant/dev-install-unix.sh"
end
  # SHELL
end
