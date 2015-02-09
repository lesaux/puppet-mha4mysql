class mha4mysql::node (

  $version      = '0.56',
  $install_dir  = '/opt',
  $download_url = 'https://72003f4c60f5cc941cd1c7d448fc3c99e0aebaa8.googledrive.com/host/0B1lu97m8-haWeHdGWXp0YVVUSlk/mha4mysql-node-0.56.tar.gz',
  $mha_user     = mysql,
  $mha_group    = mysql,
  $symlink      = true,
  $symlink_name = "$install_dir/mha-node",

) {

  if $mha4mysql::node {
  ensure_packages ( ['libdbd-mysql-perl'])

    archive { "mha4mysql-node-${mha4mysql::node::version}":
      ensure   => present,
      checksum => false,
      target   => $mha4mysql::node::install_dir,
      url      => $mha4mysql::node::download_url,
    }->

    exec { 'make mha4mysql-node': 
      path    => ['/usr/bin', '/usr/sbin', '/bin' ], 
      cwd     => "${mha4mysql::node::install_dir}/mha4mysql-node-${mha4mysql::node::version}", 
      command => 'perl Makefile.PL;make;make install',
      unless  => '/usr/bin/test -f /usr/local/bin/apply_diff_relay_logs',
    } 
  }

}
