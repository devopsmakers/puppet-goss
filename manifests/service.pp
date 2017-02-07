# == Class goss::service
#
# This class is meant to be called from goss.
# It ensure the service is running.
#
class goss::service {

  service { $::goss::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
