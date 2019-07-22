# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::manage
class opensipscp::manage {
  @service { ['httpd','mariadb']:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
  realize([Service['httpd'],Service['mariadb']])
  mysql::db { $opensipscp::db_opensips_db:
    user           => $opensipscp::db_opensips_user,
    password       => $opensipscp::db_opensips_pw,
    host           => $opensipscp::db_server_ip,
    grant          => ['ALL'],
    sql            => "${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql",
    import_cat_cmd => 'cat',
    import_timeout => 900,
    require        => [Service['mariadb'],File["${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql"]]
  }
}
