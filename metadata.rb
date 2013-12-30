name             'gitlabhq'
maintainer       'PhewCentral'
maintainer_email 'kramos@phewcentral.com'
license          'MIT License'
description      'Installs/Configures Gitlab'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

depends 'build-essential'
depends 'readline'
depends 'xml'
depends 'zlib'
depends 'python'
depends 'redisio'
depends 'ruby_build'
depends 'mysql'
depends 'postgresql'
depends 'database'
depends 'backup'
depends 'hostsfile'
depends 'nginx', '~> 2.0.0'
depends 'git', '2.7.0'
depends 'yumrepo'
depends 'yum', '< 3.0'

%w{ debian ubuntu }.each do |os|
    supports os
end
