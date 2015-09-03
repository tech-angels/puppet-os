class os::fedora {

  # Timezone
  file { "/etc/localtime":
    ensure => '/usr/share/zoneinfo/Europe/Paris',
  }

  file { "/etc/timezone":
    ensure  => present,
    content => "Europe/Paris",
  }
}
