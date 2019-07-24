# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   opensipscp::packages { 'namevar': }
define opensipscp::packages (
  $package = $title,
) {
  exec { "${package}-installation":
    command => "yum install -y ${package}",
    unless  => "rpm -qa --qf \"%{NAME}\\n\"| egrep -q \"^${package}$\"",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    # refreshonly => true,
  }
}
