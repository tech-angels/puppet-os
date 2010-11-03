class os::debian-lenny inherits debian {
  # general config for emacs (without temporary files ~ )
  file { "/etc/emacs/site-start.d/50c2c.el":
    ensure  => present,
    mode    => 644,
    source  => "puppet:///os/etc/emacs/site-start.d/50c2c.el",
    require => Package["emacs23-nox"]
  }

  # Umask, etc.
  file { "/etc/profile":
    ensure => present,
    mode   => 644,
    source => "puppet:///os/etc/profile-lenny",
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

  package {["bash-completion", "iotop"]:
    ensure => present,
  }

  apt::preferences { "c2c-mirror":
    ensure => present,
    package => "*",
    pin => "release o=c2c",
    priority => "1001",
  }

}
