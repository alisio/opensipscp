# @summary Configures OpenSIPS Control Panel, a PHP Web Portal for provisioning OpenSIPS SIP server.
#
# @example Basic usage
#
# include opensipscp
#
# To install OpenSIPS control panel besides OpenSIPS you can use my other module alisio-opensips.
# class{'opensips':} -> class{'opensipscp':}
#
# @db_opensips_db
#   The opensips database. It must match your current opensips installation. Default value: 'opensips'
# @db_opensips_user
#   The database user. Default Value: 'opensips'
# @db_opensips_pw
#   The password for the opensips database user. Default value 'opensipsrw'
# @db_root_user
#  The database admin user. It is used to insert data into opensips database.
# @db_root_pw
#  The database root password. It is used to insert data into opensips database.
# @db_server_ip
#   The opensips database host. Default value: 'localhost'
# @opensipscp_admin_user
#   The initial OpenSIPS Control Panel GUI admin user. Default value:'admin'
# @opensipscp_admin_pw
#   The initial OpenSIPS Control Panel GUI admin password. Default value: 'opensips'
# @opensipscp_alias_folder
#   The apache alias for the OpenSIPS Control Panel. Default Value: '/cp'

class opensipscp (
  $db_opensips_db           = $opensipscp::params::db_opensips_db,
  $db_opensips_user         = $opensipscp::params::db_opensips_user,
  $db_opensips_pw           = $opensipscp::params::db_opensips_pw,
  $db_root_user             = $opensipscp::params::db_root_user,
  $db_root_pw               = $opensipscp::params::db_root_pw,
  $db_server_ip             = $opensipscp::params::db_server_ip,
  $opensipscp_admin_user    = $opensipscp::params::opensipscp_admin_user,
  $opensipscp_admin_pw      = $opensipscp::params::opensipscp_admin_pw,
  $opensipscp_folder        = $opensipscp::params::opensipscp_folder,
  $opensipscp_alias_folder  = $opensipscp::params::opensipscp_alias_folder,
  $opensipscp_version       = $opensipscp::params::opensipscp_version,
  $packages                 = $opensipscp::params::packages,
) inherits opensipscp::params {
  class { 'opensipscp::install':}
  -> class { 'opensipscp::configure':}
  -> class { 'opensipscp::manage':}
}
