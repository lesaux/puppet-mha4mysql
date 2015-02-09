# puppet-mha4mysql
Install mha4mysql for manual master flip.
Services aren't managed by this module yet.

Debian OS Family only for now.

####Parameters

[ manager ]

Install the manager. Default is false.

[ node ]

Install the node. Default is false.

[ manage_user_ssh ]

Creates a user, group and keys for ssh connections. Uses provided id_rsa and id_rsa.pub so will want to regenerate these. You will need to provide values for mha4myql_user, mha4mysql_uid, mha4mysql_group and mha4mysql_gid.

[ manage_config ]

Creates a config file /etc/masterha_defaults.cnf

[ manage_dirs ]

Create manager working directory

[ fix_symlinks ]

mah4mysql requires some mysql binaries to be present in /usr/bin to this creates those symlinks for you.

[ mysql_bindir ]

Where to find mysql binaries when using fix_symlinks

[ mha4mysql_user ]

username of the ssh user

[ mha4mysql_uid ]

uid of the ssh user

[ mha4mysql_group ]

group of the ssh user

[ mha4mysql_gid ]

gid of the group and ssh user

[ config ]

Configuration hash for the /etc/masterha_default.cnf file


####Example usage:

```
class {'mha4mysql':
  manager             => true,
  node                => true,
  manage_user_ssh     => true,
  manage_config       => true,
  manage_dirs         => true,
  fix_symlinks        => true,
  mha4mysql_user      => mha4mysql,
  mha4mysql_group     => mha4mysql,
  mha4mysql_uid       => 700,
  mha4mysql_gid       => 700,
  mysql_bindir        => '/opt/percona/bin',
  mysql_user          => mysql,
  config              => {
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
      'hostname'  => '192.168.0.92',
    },
    'server2'        => {
      'hostname'  => '192.168.0.93',
    }
  }

 }
 ```
