# == Class goss::install
#
# This class is called from goss for install.
#
class goss::install {

  package { $::goss::package_name:
    ensure => present,
  }
}
