# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::install
class opensipscp::install inherits opensipscp {
  @package {'epel-release':}
  @package { $opensipscp::packages:
    ensure  => installed,
    require => Package['epel-release'],
  }
  realize(Package['epel-release'])
  realize(Package[$opensipscp::packages])
  exec { 'install_opensipscp':
    command => 'wget https://codeload.github.com/OpenSIPS/opensips-cp/zip/8.2.4 &&\
                unzip -o /var/www/html/8.2.4 && \
                rsync -av opensips-cp-8.2.4/ opensips-cp/',
    cwd     => '/var/www/html',
    unless  => 'test -d /var/www/html/opensips-cp',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    require => Package[$opensipscp::packages]
  }
  -> file { '/var/www/html/opensips-cp/':
    ensure  => directory,
    recurse => 'remote',
    mode    => '0644',
    owner   => 'apache',
    group   => 'apache',
    source  => 'puppet:///modules/opensipscp/var/www/html/opensips-cp/',
  }
}
