#
class opensipscp::params {
  $db_opensips_db           = 'opensips'
  $db_opensips_user         = 'opensips'
  $db_opensips_pw           = 'opensipsrw'
  $db_root_user             = 'root'
  $db_root_pw               = 'opensips'
  $db_server_ip             = 'localhost'
  $opensipscp_admin_user    = 'admin'
  $opensipscp_admin_pw      = 'opensips'
  $opensipscp_folder        = '/var/www/html/opensips-cp'
  $opensipscp_alias_folder  = '/cp'
  $opensipscp_version        = '8.2.4'
  $packages                 = ['httpd','mariadb-server','php','php-mysql','php-gd','php-pear','php-pecl-apcu','unzip','wget']
}
