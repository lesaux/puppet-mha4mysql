class mha4mysql::directories {

  if $mha4mysql::manage_dirs {
  $remote_workdir = $mha4mysql::config['server default']['remote_workdir']

  file {"$remote_workdir":
    ensure => directory,
    owner  => $mha4mysql::mha4mysql_user,
    group  => $mha4mysql::mha4mysql_group,
  }
  }

}
