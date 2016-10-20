name             'chefs-gem'
maintainer       'Pedro Tanaka'
maintainer_email 'boss@pedrotanaka.com.br'
license          'MIT License'
description      'Configures a machine to develop with RoR'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url       'https://github.com/pedro-stanaka/chefs-gem/issues'
source_url       'https://github.com/pedro-stanaka/chefs-gem'


# Utilities
depends 'user', '~> 0.4.2'
depends 'zsh', '~> 2.0.0'
depends 'locale', '~> 1.1.0'
depends 'vim', '~> 2.0.1'
depends 'htop', '~> 2.0.0'
depends 'git', '~> 4.5.0'
depends 'curl'
depends 'zlib'
depends 'lxmx_oh_my_zsh', '~> 0.5.0'
depends 'tmux', '~> 1.5.0'
depends 'nodejs', '~> 2.4.4'

# Ruby
depends 'rvm', '~> 0.9.4'
