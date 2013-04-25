class os::debian-wheezy inherits debian {

  # Umask, etc.
  file { "/etc/profile":
    ensure => present,
    mode   => 644,
    source => "puppet:///modules/os/etc/profile-lenny",
  }

  # Timezone
  file { "/etc/localtime":
    ensure => present,
    source => "file:///usr/share/zoneinfo/Europe/Zurich",
  }

  file { "/etc/timezone":
    ensure  => present,
    content => "Europe/Zurich",
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
