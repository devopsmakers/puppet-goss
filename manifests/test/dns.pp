# Class goss::test::dns
# ===========================
#
# dns - Validates that the provided address is resolveable and the address it
#       resolves to.
#
# Parameters
# ----------
#
# * `resolveable`
#   Whether or not the address should be resolveable.
#   Default: true
#
# * `addrs`
#   An array of expected addresses.
#   Default: undef
#
# * `timeout`
#   Test timeout in milliseconds.
#   Default: undef
#
# Example usage:
#
# Test version of go installed:
# goss::test::dns { 'localhost':
#   resolveable => true,
#   addrs       => [
#     '127.0.0.1',
#     '::1'
#   ],
#   timeout     => 1000,
# }
#
define goss::test::dns (
  $resolveable = true,
  $addrs       = undef,
  $timeout     = undef,
) {
  datacat_fragment { "goss_dns_${name}":
    target => '/etc/goss/config.yaml',
    data   => {
      dns => {
        $name => {
          resolveable => $resolveable,
          addrs       => $addrs,
          timeout     => $timeout,
        },
      },
    },
  }
}
