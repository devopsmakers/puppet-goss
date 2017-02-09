# == Class goss::install
#
# This class is called from goss for install.
#
class goss::install (
  $goss_source  = $::goss::goss_source,
  $goss_path    = $::goss::goss_path,
){

  # The Goss binary can be pulled straight from github.com or your own source
  file { $goss_path:
    ensure => 'file',
    source => $goss_source,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
