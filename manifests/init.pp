# Class: goss
# ===========================
#
# Goss is a tool for server validation testing similar to ServerSpec
# This module installs goss and creates a configuration file from
# the resources you specify.
#
# Parameters
# ----------
#
# * `goss_version`
#   The version of goss to install.
#   Default: '0.2.5'
#
# * `goss_source`
#   The `file` source to install goss from.
#   Default: From Github releases page.
#
# * `goss_path`
#   Where to put the goss binary.
#   Default: '/usr/local/bin'
#
# * `goss_serve`
#   Should we run `goss serve` as a service?
#   Default: 'false'
#
# * `serve_provider`
#   The provider to run `goss serve` with.
#   Default: 'init'
#   Supported: init
#
# * `serve_user`
#   The user to run `goss serve` as.
#   Default: 'nobody'
#
# * `serve_port`
#   The port to run `goss serve` on.
#   Default: 3000
#
# * `serve_path`
#   The url path to serve on.
#   Default: '/healthz'
#
# * `serve_output`
#   The output format to serve.
#   Default: 'json'
#   Supported: documentation, json, junit, nagios, nagios_verbose, rspecish, tap
#
class goss (
  $goss_version = $::goss::params::goss_version,
  $goss_source  = $::goss::params::goss_source,
  $goss_path    = '/usr/local/bin/goss',
  $goss_serve   = false,
  $serve_user   = 'nobody',
  $serve_port   = 3000,
  $serve_path    = '/healthz',
  $serve_output = 'json',
) inherits ::goss::params {

  # validate parameters here
  validate_string($goss_version)
  validate_string($goss_source)
  validate_absolute_path($goss_path)
  validate_bool($goss_serve)
  validate_string($serve_user)
  validate_integer($serve_port)
  validate_absolute_path($serve_path)

  validate_re($serve_output,
    [ '^documentation$', '^json$', '^junit$', '^nagios$',
      '^nagios_verbose$', '^rspecish$', '^tap$' ] )

  class { '::goss::install': } ->
  class { '::goss::config': } ~>
  class { '::goss::service': } ->
  Class['::goss']
}
