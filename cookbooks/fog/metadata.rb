maintainer       "Gerald L. Hevener Jr., M.S."
maintainer_email "jackl0phty@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures FOG"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

%w( mysql ).each { |cb| depends cb }
