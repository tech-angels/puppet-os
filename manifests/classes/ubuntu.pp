class os::ubuntu {
  #
  # Default packages
  #
  package {
    "lsof": ensure => present;
    "tiobench": ensure => present; # Useful for doing IO benchmarks
    "smartmontools": ensure => present; # SMART monitoring
    "at" : ensure => present; # usefull for reboots...
    "unzip": ensure => present;
    "zip": ensure => present;
    "iproute": ensure => present;
    "curl": ensure => present;
    "screen": ensure => present;
    "vim": ensure => present;
    "lynx": ensure => present;
    "bzip2": ensure => present;
    "patch": ensure => present;
    "file": ensure => present;
    "less": ensure => present;
    "rsync": ensure => present;
    "psmisc": ensure => present;
    "iptraf": ensure => present;
    "whois": ensure => present;
    "pwgen": ensure => present;
    "locate": ensure => absent;
  }
  
  file {"/etc/profile.d":
    ensure => directory
  }

  # SSL Configuration
  package {
    "ca-certificates": ensure => present;
  }

  package { ["openssl", "openssh-server", "openssh-client", "openssh-blacklist", "ssl-cert" ]:
    ensure => installed,
    require => Exec["apt-get_update"]
  }

  exec {"sysctl-reload":
    command     => "sysctl -p",
    refreshonly => true,
  }

  package {"debian-archive-keyring":
    ensure => latest,
  }

  cron {"Keeps a fresh apt database":
    command  => "/usr/bin/apt-get update -q=2",
    ensure   => present,
    hour     => 4,
    minute   => fqdn_rand(60),
  }

  exec { "update-alternatives --set editor /usr/bin/vim.basic":
    unless => "test /etc/alternatives/editor -ef /usr/bin/vim.basic"
  }
}
