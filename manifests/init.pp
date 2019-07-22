# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp
class opensipscp (
  $db_opensips_db           = $opensipscp::params::db_opensips_db,
  $db_opensips_user         = $opensipscp::params::db_opensips_user,
  $db_opensips_pw           = $opensipscp::params::db_opensips_pw,
  $db_server_ip             = $opensipscp::params::db_server_ip,
  $opensipscp_folder        = $opensipscp::params::opensipscp_folder,
  $opensipscp_alias_folder  = $opensipscp::params::opensipscp_alias_folder,
  $opensipscp_versao        = $opensipscp::params::opensipscp_versao,
  $packages                 = $opensipscp::params::packages,
) inherits opensipscp::params {
  class { 'opensipscp::install':}
  -> class { 'opensipscp::configure':}
  -> class { 'opensipscp::manage':}
}
