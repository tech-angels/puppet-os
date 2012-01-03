class os::debian-lenny inherits debian {

  # Umask, etc.
  file { "/etc/profile":
    ensure => present,
    mode   => 644,
    source => "puppet:///modules/os/etc/profile-lenny",
  }

  # Timezone
  file { "/etc/localtime":
    ensure => present,
    source => "file:///usr/share/zoneinfo/Europe/Paris",
  }

  file { "/etc/timezone":
    ensure  => present,
    content => "Europe/Paris",
  }

  # Kernel
  file { "/etc/modules":
    ensure => present,
  }

  package {["bash-completion", "iotop"]:
    ensure => present,
  }

}
