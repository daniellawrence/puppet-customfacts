# staticfact - All you need here is a name and value
# customfacts::staticfact { 'fact_name':
#   value => 'fact_value';
# }
define customfacts::staticfact (
  $value,
){
  include customfacts

  $staticfact_file = "${customfacts::configddir}/staticfact_${name}"

  file{ $staticfact_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('customfacts/static_fact.erb'),
    require => Class['customfacts'];
  }

}
