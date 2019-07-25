# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::configure
class opensipscp::configure inherits opensipscp {
  require opensipscp::install
  file { '/etc/httpd/conf.d/opensips_cp.conf':
      ensure  => file,
      content => template('opensipscp/etc/httpd/conf.d/opensips_cp.conf.erb'),
      mode    => '0644',
      require => Opensipscp::Packages[$opensipscp::packages],
  }
  file { '/var/www/html/opensips-cp/config/boxes.global.inc.php':
    ensure  => file,
    mode    => '0644',
    content => template('opensipscp/var/www/html/opensips-cp/config/boxes.global.inc.php.erb'),
  }
  augeas { 'enable_gd_php_extension':
    context => '/augeas/files/etc/php.d/gd.ini',
    changes => [
      'set /files/etc/php.d/gd.ini/.anon/enable "gd.so"',
      'set /files/etc/php.d/gd.ini/.anon/#comment "managed by puppet"',
    ],
  }
  augeas { 'enable_mysql_php_extension':
    context => '/augeas/files/etc/php.d/mysql.ini',
    changes => [
      'set /files/etc/php.d/mysql.ini/.anon/enable "mysql.so"',
      'set /files/etc/php.d/mysql.ini/.anon/#comment "managed by puppet"',
    ],
  }
  cron { 'run the statistics sampling once every minute':
    command => 'cd /var/www/opensips-cp/; /usr/bin/php cron_job/get_opensips_stats.php',
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }
  cron { 'run the statistics sampling once every 10 minutes':
    command => 'cd /var/www/opensips-cp/; /usr/bin/php cron_job/get_opensips_stats.php',
    user    => 'root',
    hour    => '*',
    minute  => 10,
  }

  if ! defined(Mysql::Db[$opensipscp::db_opensips_db]) {
    class { 'mysql::server':
      root_password => $opensipscp::db_root_pw,
    }
    -> mysql::db { $opensipscp::db_opensips_db :
      user           => $opensipscp::db_opensips_user,
      password       => $opensipscp::db_opensips_pw,
      host           => $opensipscp::db_server_ip,
      grant          => ['ALL'],
      sql            => "${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql",
      import_cat_cmd => 'cat',
      import_timeout => 900,
    }
  }
}
