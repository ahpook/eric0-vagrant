
# life without these is not worth living
package { ['vim-enhanced','git']:
  ensure => latest,
}

# set up inbound 8140
file { '/etc/sysconfig/iptables':
  ensure  => present,
  content => file('/tmp/vagrant-puppet/manifests/iptables'),
  notify  => Service['iptables'],
}

service { 'iptables':
  ensure => running,
}

# set up vagrant user's .bashrc
file { '/home/vagrant/.bashrc':
  ensure  => present,
  content => file('/tmp/vagrant-puppet/manifests/vagrant_bashrc'),
}
