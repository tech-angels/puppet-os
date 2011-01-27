import "classes/*.pp"
import "definitions/*.pp"

class os {

  file { "/tmp":
    ensure => directory,
    mode   => 1777,
    owner  => root,
    group  => root
  }

  case $operatingsystem {
    debian: {
      case $lsbdistcodename {
        lenny: {
          include os::debian-lenny
        }

        default: {
          fail "Unsupported Debian version '${lsbdistcodename}' in 'os' module"
        }
      }
    }

    default: {
      fail "Unsupported OS ${operatingsystem} in 'os' module"
    }
  }
}
