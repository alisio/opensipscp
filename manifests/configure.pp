# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::configure
class opensipscp::configure inherits opensipscp {
  file { '/etc/httpd/conf.d/opensips_cp.conf':
      ensure  => file,
      content => template('opensipscp/etc/httpd/conf.d/opensips_cp.conf.erb'),
      mode    => '0644',
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
}
