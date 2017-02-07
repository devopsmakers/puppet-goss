# == Class goss::params
#
# This class is meant to be called from goss.
# It sets variables according to platform.
#
class goss::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'goss'
      $service_name = 'goss'
    }
    'RedHat', 'Amazon': {
      $package_name = 'goss'
      $service_name = 'goss'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
