class mha4mysql::config {

  if $mha4mysql::manage_config {

    file { '/etc/masterha_default.cnf':
      content => template('mha4mysql/masterha_default.cnf.erb'),
      mode    => '0644',
      owner   => "$mha4mysql::mha4mysql_user",
    }

  }

}
