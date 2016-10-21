
include_recipe 'nodejs::nodejs'
include_recipe 'nodejs::npm'

execute 'node old executable linking' do
  command 'sudo ln -s /usr/bin/nodejs /usr/bin/node'
  only_if { platform_family?('debian') }
  not_if { File.exist?('/usr/bin/node') }
end

nodejs_npm 'grunt'
nodejs_npm 'gulp'
nodejs_npm 'coffee-script'
nodejs_npm 'bower'
nodejs_npm 'yo'


include_recipe 'redisio'
include_recipe 'redisio::enable'


