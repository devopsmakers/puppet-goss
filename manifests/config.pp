# == Class goss::config
#
# This class is called from goss for config.
#
class goss::config {

  file { '/etc/goss':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
  } ->

  datacat { '/etc/goss/config.yaml':
    template => 'goss/etc/goss/config.yaml.erb',
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
  }

}
