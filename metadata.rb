name             'gitlabhq'
maintainer       'Wide Eye Labs'
maintainer_email 'chris@wideeyelabs.com'
license          'MIT License'
description      'Installs/Configures Gitlab'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'

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
depends 'nginx'
depends 'git'
depends 'yumrepo'

%w{ debian ubuntu }.each do |os|
    supports os
end
