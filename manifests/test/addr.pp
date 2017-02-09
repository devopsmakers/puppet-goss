# Class goss::test::addr
# ===========================
#
# addr - Validates if a remote `address:port` are accessible.
#
# Parameters
# ----------
#
# * `reachable`
#   Whether the port should be reachable or not.
#   Default: true
#
# * `timeout`
#   Milliseconds after which the test will fail.
#   Default: undef
#
# Example usage:
#
# Test port 3306 is accessible on localhost within 1 second:
# goss::test::addr { 'tcp://127.0.0.1:3306':
#   reachable => true,
#   timeout   => 1000,
# }
#
# Test port 3306 is not accessible on servers IP:
# goss::test::addr { 'tcp://10.0.21.10:3306':
#   reachable => false,
#   timeout   => 1000,
# }
#
define goss::test::addr (
  $reachable = true,
  $timeout   = undef,
) {
  datacat_fragment { "goss_addr_${name}":
    target => '/etc/goss/config.yaml',
    data   => {
      addr => {
        $name => {
          reachable => $reachable,
          timeout   => $timeout,
        },
      },
    },
  }
}
