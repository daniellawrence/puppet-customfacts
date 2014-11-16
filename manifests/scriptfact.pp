# Pass this a template that will be used to display facts to facter
define customfacts::scriptfact (
  $facttemplate
){
  # include customfacts

  $scriptfact_file = "${customfacts::configddir}/scriptfact_${name}"

  file{ $scriptfact_file:
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
    content  => template($facttemplate),
    require  => Class['Customfacts'];
  }

}
