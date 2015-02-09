class mha4mysql::manager (

  $version      = '0.56',
  $install_dir  = '/opt',
  $download_url = 'https://72003f4c60f5cc941cd1c7d448fc3c99e0aebaa8.googledrive.com/host/0B1lu97m8-haWeHdGWXp0YVVUSlk/mha4mysql-manager-0.56.tar.gz',
  $mha_user     = mysql,
  $mha_group    = mysql,
  $symlink      = true,
  $symlink_name = "$install_dir/mha-manager",

) {

  if $mha4mysql::manager {
  ensure_packages ( ['libdbd-mysql-perl', 'libconfig-tiny-perl', 'liblog-dispatch-perl', 'libparallel-forkmanager-perl']) 

    archive { "mha4mysql-manager-${mha4mysql::manager::version}":
      ensure   => present,
      checksum => false,
      target   => $mha4mysql::manager::install_dir,
      url      => $mha4mysql::manager::download_url,
    }->

    exec { 'make mha4mysql-manager':
      path    => ['/usr/bin', '/usr/sbin', '/bin' ],
      cwd     => "${mha4mysql::manager::install_dir}/mha4mysql-manager-${mha4mysql::manager::version}",
      command => 'perl Makefile.PL;make;make install',
      unless  => '/usr/bin/test -f /usr/local/bin/masterha_manager',
    }
  }

}
