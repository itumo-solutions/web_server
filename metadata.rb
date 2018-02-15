name 'web_server'
maintainer 'iTumo Solutions'
maintainer_email 'info@itumo-solutions.com'
license 'All Rights Reserved'
description 'Installs/Configures web_server'
long_description 'Installs/Configures web_server'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/itumo-solutions/web_server/issues' if respond_to?(:issues_url)
source_url 'https://github.com/itumo-solutions/web_server/issues' if respond_to?(:source_url)
supports 'ubuntu'

depends 'httpd', '~> 0.4'
depends 'mysql', '~> 8.0'
depends 'mysql2_chef_gem', '~> 2.0'
depends 'database', '~> 6.1'
