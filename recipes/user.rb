group node['chefs_gem']['group']

user node['chefs_gem']['user'] do
  comment 'The default user of application'
  group node['chefs_gem']['group']
  shell '/usr/bin/zsh'
end

user_account 'vagrant' do
  shell '/usr/bin/zsh'
end

lxmx_oh_my_zsh_user node['chefs_gem']['user'] do
  plugins %w(git ruby rvm bower debian node npm tmux)
  home "/home/#{node['chefs_gem']['user']}"
  theme          'steeef'
  autocorrect    false
  case_sensitive true
end


lxmx_oh_my_zsh_user 'vagrant' do
  plugins %w(git ruby rvm bower debian node npm tmux)
  home '/home/vagrant'
  theme          'steeef'
  autocorrect    false
  case_sensitive true
end