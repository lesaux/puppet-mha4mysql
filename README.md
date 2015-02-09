# puppet-mha4mysql
Install mha4mysql

####Parameters

[ manager ]

Install the manager. Default is false.

[ node ]

Install the node. Default is false.

[ manage_user_ssh ]

Creates a user, group and keys for ssh connections. Uses provided id_rsa and id_rsa.pub so will want to regenerate these. You will need to provide values for mha4myql_user, mha4mysql_uid, mha4mysql_group and mha4mysql_gid.

[ manage_config ]

Creates a config file /etc/masterha_defaults.cnf

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


####Example usage:

```
class {'mha4mysql':
  manager             => true,
  node                => true,
  manage_user_ssh     => true,
  manage_config       => true,
  fix_symlinks        => true,
  mha4mysql_user      => mha4mysql,
  mha4mysql_group     => mha4mysql,
  mha4mysql_uid       => 700,
  mha4mysql_gid       => 700,
  mysql_bindir        => '/opt/percona/bin',
 }
 ```
