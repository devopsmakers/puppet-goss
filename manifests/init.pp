# Class: goss
# ===========================
#
# Full description of class goss here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class goss (
  $package_name = $::goss::params::package_name,
  $service_name = $::goss::params::service_name,
) inherits ::goss::params {

  # validate parameters here

  class { '::goss::install': } ->
  class { '::goss::config': } ~>
  class { '::goss::service': } ->
  Class['::goss']
}
