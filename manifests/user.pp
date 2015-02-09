class mha4mysql::user {

  if $mha4mysql::manage_user_ssh {

    group { "mha4mysql::mha4mysql_group":
      name                 => $mha4mysql::mha4mysql_group,
      ensure               => present,
      system               => true,
      gid                  => $mha4mysql::mha4mysql_gid,
    }
    user { "mha4mysql::mha4mysql_user":
      name                 => $mha4mysql::mha4mysql_user,
      ensure               => present,
      comment              => "mha4mysql system account",
      gid                  => $mha4mysql::mha4mysql_gid,
      home                 => "/home/${mha4mysql::mha4mysql_user}",
      managehome           => true,
      shell                => '/bin/bash',
      system               => true,
      uid                  => $mha4mysql::mha4mysql_uid,
      require              => Group['mha4mysql::mha4mysql_group'],
    }


    file { "/home/${mha4mysql::mha4mysql_user}/.ssh":
      ensure => directory,
      mode => 600,
      owner => "$mha4mysql::mha4mysql_user",
    }
    file { "/home/${mha4mysql::mha4mysql_user}/.ssh/id_rsa":
      require => File["/home/${mha4mysql::mha4mysql_user}/.ssh"],
      source => "puppet:///modules/mha4mysql/ssh/id_rsa",
      mode => 600,
      owner => "$mha4mysql::mha4mysql_user",
    }
    file { "/home/${mha4mysql::mha4mysql_user}/.ssh/id_rsa.pub":
      require => File["/home/${mha4mysql::mha4mysql_user}/.ssh"],
      source => "puppet:///modules/mha4mysql/ssh/id_rsa.pub",
      mode => 644,
      owner => "$mha4mysql::mha4mysql_user",
    }
    file { "/home/${mha4mysql::mha4mysql_user}/.ssh/authorized_keys":
      require => File["/home/${mha4mysql::mha4mysql_user}/.ssh"],
      source => "puppet:///modules/mha4mysql/ssh/id_rsa.pub",
      mode => 600,
      owner => "$mha4mysql::mha4mysql_user",
    }

    #file { "/root/.ssh/known_hosts":
    #  require => File["/root/.ssh"],
    #  source => "puppet:///modules/mha4mysql/ssh/known_hosts",
    #  mode => 644,
    #  owner => "root",
    #}

  }

}
