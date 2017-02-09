# == Class goss::params
#
# This class is meant to be called from goss.
# It sets variables according to platform.
#
class goss::params {
  case $::kernel {
    'Linux': {
      $goss_version = '0.2.5'
      case $::architecture {
        'x86_64': {
          $goss_source  = "https://github.com/aelsabbahy/goss/releases/download/v${goss_version}/goss-linux-amd64"
        }
        'i386': {
          $goss_source  = "https://github.com/aelsabbahy/goss/releases/download/v${goss_version}/goss-linux-386"
        }
        default: {
          fail("${::architecture} not supported")
        }
      }
      $goss_path    = '/usr/local/bin/goss'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
