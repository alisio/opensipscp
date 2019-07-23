# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include opensipscp::install
class opensipscp::install inherits opensipscp {
  ensure_packages(['epel-release',$opensipscp::packages])
  # ensure_packages($opensipscp::packages)
  exec { 'install_opensipscp':
    command => "wget https://codeload.github.com/OpenSIPS/opensips-cp/zip/${opensipscp::opensipscp_version} &&\
                unzip -o /var/www/html/${opensipscp::opensipscp_version} && \
                rsync -av opensips-cp-${opensipscp::opensipscp_version}/ opensips-cp/ && \
                chown -R apache:apache opensips-cp/",
    cwd     => '/var/www/html',
    unless  => "test -d ${opensipscp::opensipscp_folder}",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    require => Package[$opensipscp::packages]
  }
  file { "${opensipscp::opensipscp_folder}/opensips_controlpanel.mysql":
    ensure  => file,
    mode    => '0644',
    owner   => 'apache',
    group   => 'apache',
    content => template('opensipscp/opensips_controlpanel.mysql.erb'),
  }
}
