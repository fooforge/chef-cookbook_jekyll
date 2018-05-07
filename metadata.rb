name		 'jekyll'
maintainer       "Mike Adolphs"
maintainer_email "mike@fooforge.com"
license          "Apache 2.0"
description      "Installs/Configures a Jekyll blog"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.10"

depends          "rbenv" # http://fnichol.github.com/chef-rbenv/
depends          "apache2"

supports         "debian"
supports	 "centos"
