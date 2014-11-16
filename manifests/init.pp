# Make sure everything is ready for the custfacts:: modules
class customfacts(
  $configdir = "/etc/facter",
  $configddir = "/etc/facter/facts.d",
  $template = "customfacts/staticfact.erb",
  $packagename = "facter",
) {
  class{'customfacts::install': } ->
  Class["customfacts"]

  # Grab all the known facts from hiera.
  $hiera_staticfact_hash = hiera_hash('customfacts::staticfact', {})
  $hiera_scriptfact_hash = hiera_hash('customfacts::scriptfact', {})

  # using the hiera information, create the customfact resources
  create_resources('customfacts::staticfact', $hiera_staticfact_hash)
  create_resources('customfacts::scriptfact', $hiera_scriptfact_hash)

}
