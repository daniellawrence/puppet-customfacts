class customfacts::install {

  package{ 'facter':
    ensure => installed;
  }

  file{ '/etc/facter':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['facter'];
  }

  file{ '/etc/facter/facts.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => [
                 File['/etc/facter'],
                 Package['facter']
               ]
  }

}
