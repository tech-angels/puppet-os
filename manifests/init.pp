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
        squeeze: {
          include os::debian-squeeze
        }
        wheezy: {
          include os::debian-wheezy
        }
        jessie: {
          include os::debian-jessie
        }
        sid: {
          include os::debian-sid
        }


        default: {
          fail "Unsupported Debian version '${lsbdistcodename}' in 'os' module"
        }
      }
    }

    ubuntu: {
      case $lsbdistcodename {
        precise: {
          include os::ubuntu-precise
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
