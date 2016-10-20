
default['chefs_gem']['user'] = 'deploy'
default['chefs_gem']['group'] = 'deploy'


# Database

default['chefs_gem']['database']['host'] = 'localhost'
default['chefs_gem']['database']['username'] = 'root'
default['chefs_gem']['database']['password'] = node['mariadb']['server_root_password']
default['chefs_gem']['database']['dbname'] = 'chefsgem'
default['chefs_gem']['database']['app']['username'] = 'phpapp'
default['chefs_gem']['database']['app']['password'] = 'appsecret'


default['mariadb']['install']['version'] = '10.0'
case node['platform']
when 'ubuntu'
  default['mariadb']['install']['version'] = '5.5'
  case node['platform_version'].to_f
  when 16.04
    default['mariadb']['install']['version'] = '10.0'
    default['mariadb']['client']['development_files'] = false
    default['chefs_gem']['database']['packages'] = \
      %w(libmariadb-client-lgpl-dev libmariadbd-dev libmysqlclient-dev)
  end
when 'debian'
  default['mariadb']['client']['development_files'] = false
  default['chefs_gem']['database']['packages'] = \
    %w(libmariadb-client-lgpl-dev libmariadbd-dev)
end

case node['platform_family']
when 'rhel', 'fedora'
  default['mariadb']['install']['prefer_os_package'] = true
when 'debian'
  default['mariadb']['apt_repository']['base_url'] = 'mirrors.digitalocean.com/mariadb/repo/'
  default['mariadb']['install']['prefer_os_package'] = false
end

## PostgreSQL
default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil,            method: 'trust' },
  { type: 'local', db: 'all', user: 'all',      addr: nil,            method: 'trust' },
  { type: 'host',  db: 'all', user: 'all',      addr: '0.0.0.0/32',   method: 'md5'   },
  { type: 'host',  db: 'all', user: 'all',      addr: '127.0.0.1/32', method: 'trust' },
  { type: 'host',  db: 'all', user: 'all',      addr: '::1/128',      method: 'trust' }
]
default['postgresql']['initdb_locale'] = 'en_US.UTF8'
default['postgresql']['password']['postgres'] = 'postgres'

if platform?('ubuntu') && node['platform_version'].to_f > 14.04
  # Ubuntu Xenial
  default['postgresql']['version'] = '9.5'
  default['postgresql']['dir'] = '/etc/postgresql/9.5/main'
  default['postgresql']['client']['packages'] = ['postgresql-client-9.5', 'libpq-dev']
  default['postgresql']['server']['packages'] = ['postgresql-9.4']
  default['postgresql']['contrib']['packages'] = ['postgresql-contrib-9.4']
end

# Utilities
default['rvm']['user_installs'] = [
  {
    'user'          => 'vagrant',
    'default_ruby'  => '2.3.1',
    'rubies'        => ['2.3.1'],
    'global_gems' => [
      { 'name'    => 'bundler' },
      { 'name'    => 'rake' },
      { 'name'    => 'sass' },
      { 'name'    => 'capistrano' }
    ]
  }
]

if platform?('ubuntu') && node['platform_version'].to_f > 14.04
  default['nodejs']['packages'] = ['nodejs', 'npm', 'nodejs-dev']
end
