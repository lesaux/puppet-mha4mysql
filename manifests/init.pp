class mha4mysql (

  $manager             = false,
  $node                = false,
  $manage_user_ssh     = false,
  $manage_config       = false,
  $fix_symlinks        = false,
  $mysql_bindir        = '/opt/percona/bin',
  $mha4mysql_user      = 'mha4mysql',
  $mha4mysql_uid       = '700',
  $mha4mysql_group     = 'mha4mysql',
  $mha4mysql_gid       = '700',

) {

  class {'mha4mysql::node': }->
  class {'mha4mysql::manager': }->
  class {'mha4mysql::user': }->
  class {'mha4mysql::fix': }->
  class {'mha4mysql::config': }

}
