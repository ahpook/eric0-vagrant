# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# this is somewhat awful but i am using nocm variants of the boxes,
# to run puppet from the shared filesystem. but that means some setup
# is needed to prepare the environment then propagate it through sudo
myscript = <<END
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install ruby rubygem-json puppet
sed -ie '/secure_path/d' /etc/sudoers
[[ `grep RUBYLIB /etc/sudoers` ]] || echo 'Defaults   env_keep += "RUBYLIB PATH"'  >> /etc/sudoers
END

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # plugin configuration for landrush - https://github.com/phinze/landrush
  config.landrush.enabled = true
  config.landrush.tld = 'vmlocal'
  config.landrush.upstream '10.240.0.10'

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.define :glitched do |glitched_config|
    glitched_config.vm.box = "puppetlabs/centos-7.0-64-puppet"
    glitched_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    glitched_config.vm.hostname = "glitched.vmlocal"
    glitched_config.vm.provision :shell, inline: myscript
    glitched_config.vm.provision :puppet
  end

  config.vm.define :ditched do |ditched_config|
    ditched_config.vm.box = "dhoppe/debian-8.1.0-amd64-nocm"
    ditched_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    ditched_config.vm.hostname = "ditched.vmlocal"
#    ditched_config.vm.provision :shell, inline: myscript
#    ditched_config.vm.provision :puppet
  end

  config.vm.define :glitcher do |glitcher_config|
    glitcher_config.vm.box = "puppetlabs/centos-7.2-64-nocm"
    glitcher_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    glitcher_config.vm.hostname = "glitcher.vmlocal"
    glitcher_config.vm.provision :shell, inline: myscript
    glitcher_config.vm.provision :puppet
  end

  config.vm.define :deglitch do |deglitch_config|
    deglitch_config.vm.box = "puppetlabs/centos-6.5-64-puppet"
    deglitch_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    deglitch_config.vm.hostname = "deglitch.vmlocal"
    deglitch_config.vm.provision :shell, inline: myscript
    deglitch_config.vm.provision :puppet
  end

  config.vm.define :cheffy do |cheffy_config|
    cheffy_config.vm.box = "centos64"
    cheffy_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    cheffy_config.vm.hostname = "cheffy.vmlocal"
    cheffy_config.vm.provision :shell, inline: myscript
    cheffy_config.vm.provision :puppet
  end

  config.vm.define :victim do |victim_config|
    victim_config.vm.box = "centos64"
    victim_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    victim_config.vm.hostname = "victim.vmlocal"
    victim_config.vm.provision :shell, inline: myscript
    victim_config.vm.provision :puppet
  end

  config.vm.define :gl5tch do |gl5tch_config|
    gl5tch_config.vm.box = "centos5"
    gl5tch_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    gl5tch_config.vm.hostname = "gl5tch.vmlocal"
    gl5tch_config.vm.provision :shell, inline: myscript
    gl5tch_config.vm.provision :puppet
  end

  config.vm.define :glutch do |glutch_config|
    glutch_config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    glutch_config.vm.synced_folder "/Users/eric/Sandbox", "/Sandbox"
    glutch_config.vm.hostname = "glutch.vmlocal"
    glutch_config.vm.provision :puppet
  end
 
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"
 
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

config.vm.provider "vmware_fusion" do |v|
  v.vmx["memsize"] = "3300"
end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "init.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
