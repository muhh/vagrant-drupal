name             'mywebapp'
maintainer       'freistil IT Ltd'
maintainer_email 'cookbooks@freistil.it'
license          'Apache 2.0'
description      'Installs/Configures mywebapp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "apt"
depends "build-essential"
depends "database"
depends "mysql"
depends "php"
