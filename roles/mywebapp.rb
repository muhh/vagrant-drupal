name "mywebapp"
description "a small webapplication role"

run_list(
  "recipe[apt]",
  "recipe[mywebapp]",
  "recipe[mywebapp::apache2]",
  "recipe[mywebapp::php]",
  "recipe[mywebapp::mysql]"
)

default_attributes({
})

override_attributes({
  #'apache' => {
  #  'listen_ports' => [ "81" ]
  #}
})
