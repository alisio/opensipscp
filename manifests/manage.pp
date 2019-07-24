# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::manage
class opensipscp::manage {
  exec { 'manage httpd service':
    command => 'systemctl enable httpd; systemctl start httpd',
    unless  => 'systemctl status httpd',
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
  exec { 'manage mariadb service':
    command => 'systemctl enable mariadb; systemctl start mariadb',
    unless  => 'systemctl status mariadb',
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
  exec { 'insert opensips cp tables into database':
    command => "mysql -u${opensipscp::db_opensips_user} -p${opensipscp::db_opensips_pw} \
                ${opensipscp::db_opensips_db} < ${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql",
    unless  => "mysql -u${opensipscp::db_opensips_user} -p${opensipscp::db_opensips_pw} ${opensipscp::db_opensips_db} \
                -e 'SHOW TABLES LIKE \"ocp_admin_privileges\"'| egrep 'ocp_admin_privileges' -q",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    # refreshonly => true,
    require => [Exec['manage mariadb service'],File["${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql"]]
  }
}
