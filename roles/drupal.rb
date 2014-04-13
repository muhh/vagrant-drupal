name "drupal"
description "Drupal dev VM"

run_list(
  "recipe[apt]",
  "recipe[drupal]",
  "recipe[drupal::apache2]",
  "recipe[drupal::php]",
  "recipe[drupal::mysql]"
)

default_attributes({
})

override_attributes({
  #'apache' => {
  #  'listen_ports' => [ "81" ]
  #}
})
