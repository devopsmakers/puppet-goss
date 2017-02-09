# Class goss::test::command
# ===========================
#
# command - Validates the exit-status and output of a command.
#
# Parameters
# ----------
#
# * `exit_status`
#   The expected exit code of the command.
#   Default: 0
#
# * `stdout`
#   An array of expected output to match on stdout.
#   Default: undef
#
# * `stderr`
#   An array of expected output to match on stderr.
#   Default: undef
#
# * `timeout`
#   Test timeout in milliseconds.
#   Default: undef
#
# Example usage:
#
# Test version of go installed:
# goss::test::command { 'go version':
#   exit_status => 0,
#   stdout      => ['go version go1.6 linux/amd64'],
#   stderr      => [],
#   timeout     => 1000,
# }
#
define goss::test::command (
  $exit_status = 0,
  $stdout      = undef,
  $stderr      = undef,
  $timeout     = undef,
) {
  datacat_fragment { "goss_command_${name}":
    target => '/etc/goss/config.yaml',
    data   => {
      command => {
        $name => {
          exit-status => $exit_status,
          stdout      => $stdout,
          stderr      => $stderr,
          timeout     => $timeout,
        },
      },
    },
  }
}
