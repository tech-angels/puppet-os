class os::debian-wheezy inherits debian {

  # Umask, etc.
  file { "/etc/profile":
    ensure => present,
    mode   => 644,
    source => "puppet:///modules/os/etc/profile-wheezy",
  }

  # Timezone
  file { "/etc/localtime":
    ensure => '/usr/share/zoneinfo/Europe/Paris',
  }

  file { "/etc/timezone":
    ensure  => present,
    content => "Europe/Paris",
  }

  # Kernel
  file { "/etc/modules":
    ensure => present,
  }

  package {
    "bash-completion":  ensure => present;
    "iotop":            ensure => present;
  }

}
