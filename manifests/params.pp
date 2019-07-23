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
# @db_server_ip 
#   The opensips database host. Default value: 'localhost'
# @opensipscp_admin_user 
#   The initial OpenSIPS Control Panel GUI admin user. Default value:'admin'
# @opensipscp_admin_pw 
#   The initial OpenSIPS Control Panel GUI admin password. Default value: 'opensips'
# @opensipscp_alias_folder  
#   The apache alias for the OpenSIPS Control Panel. Default Value: '/cp'


#
# @param package_name
# @example
#   include opensipscp::params
class opensipscp::params {
  $db_opensips_db           = 'opensips'
  $db_opensips_user         = 'opensips'
  $db_opensips_pw           = 'opensipsrw'
  $db_server_ip             = 'localhost'
  $opensipscp_admin_user    = 'admin'
  $opensipscp_admin_pw      = 'opensips'
  $opensipscp_folder        = '/var/www/html/opensips-cp'
  $opensipscp_alias_folder  = '/cp'
  $opensipscp_version        = '8.2.4'
  $packages                 = [
                                'httpd',
                                'mariadb-server',
                                'php',
                                'php-mysql',
                                'php-gd',
                                'php-pear',
                                'php-pecl-apc',
                                'unzip',
                                'wget'
                              ]
}
