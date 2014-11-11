
case $osfamily {

  'RedHat': {
    # life without these is not worth living
    package { ['vim-enhanced','git']:
      ensure => latest,
    }

    # set up inbound 8140
    file { '/etc/sysconfig/iptables':
      ensure  => present,
      content => file('/tmp/vagrant-puppet-2/manifests/iptables'),
      notify  => Service['iptables'],
    }

    service { 'iptables':
      ensure => running,
    }

  }
  'Debian': {
    # life without these is not worth living
    package { ['vim','vim-puppet','tmux']:
      ensure => latest,
    }
  }

}

# set up vagrant user's .bashrc
    file { '/home/vagrant/sandbox.sh':
      ensure  => present,
      mode    => 0755,
      content => file('/tmp/vagrant-puppet-2/manifests/vagrant_bashrc'),
    }
