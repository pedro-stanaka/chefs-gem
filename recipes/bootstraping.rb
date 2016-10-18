
execute 'apt-get update' do
  command 'apt-get update --fix-missing --quiet'
  action :run
  only_if { platform_family?('debian') }
end

include_recipe 'vim'
include_recipe 'zsh'
include_recipe 'tmux'
include_recipe 'htop'
include_recipe 'git'
include_recipe 'curl'
include_recipe 'zlib'
include_recipe 'locale' if platform?('ubuntu')
include_recipe 'user::data_bag'
include_recipe 'lxmx_oh_my_zsh'
