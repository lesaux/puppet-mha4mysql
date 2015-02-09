class mha4mysql (

  $manager             = false,
  $node                = false,
  $manage_user_ssh     = false,
  $manage_config       = false,
  $manage_dirs         = false,
  $fix_symlinks        = false,
  $mysql_bindir        = '/opt/percona/bin',
  $mha4mysql_user      = 'mha4mysql',
  $mha4mysql_uid       = '700',
  $mha4mysql_group     = 'mha4mysql',
  $mha4mysql_gid       = '700',
  $mysql_group         = 'mysql',
  $config              = {
    'server default' => {
      'user'                            => 'root',
      'password'                        => 'password',
      'ssh_user'                        => 'mha4mysql',
      'repl_user'                       => 'repl',
      'repl_password'                   => 'password',
      'master_binlog_dir'               => '/mysql/logs',
      'remote_workdir'                  => '/mysql/masterha',
      'secondary_check_script'          => 'masterha_secondary_check -s remote_host1 -s remote_host2',
      'ping_interval'                   => '3',
      '#master_ip_failover_script'      => '/opt/mha4mysql-manager-0.56/samples/scripts/master_ip_online_change',
      '#master_ip_online_change_script' => '/opt/mha4mysql-manager-0.56/samples/scripts/master_ip_online_change',
      '#shutdown_script'                => '/script/masterha/power_manager',
      '#report_script'                  => '/script/masterha/send_master_failover_mail',
    },
    'server1'        => {
      'hostname'                        => '192.168.0.92',
    },
    'server2'        => {
      'hostname'                        => '192.168.0.93',
    }
  }


) {

  class {'mha4mysql::node': }->
  class {'mha4mysql::manager': }->
  class {'mha4mysql::user': }->
  class {'mha4mysql::fix': }->
  class {'mha4mysql::directories': }->
  class {'mha4mysql::config': }

}
