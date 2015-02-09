class mha4mysql::fix {

#https://code.google.com/p/mysql-master-ha/issues/detail?id=17

  file { '/usr/bin/mysqlbinlog':
    ensure  => link,
    target  => "${mha4mysql::mysql_bindir}/mysqlbinlog",
  }

  file { '/usr/bin/mysql':
    ensure  => link,
    target  => "${mha4mysql::mysql_bindir}/mysql",
  }

}
