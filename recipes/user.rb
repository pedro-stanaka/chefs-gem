group node['chefs-gem']['group']

user node['chefs-gem']['user'] do
  comment 'The default user of application'
  group node['chefs-gem']['group']
  shell '/usr/bin/zsh'
end

user_account 'vagrant' do
  shell '/usr/bin/zsh'
end

lxmx_oh_my_zsh_user node['chefs-gem']['user'] do
  plugins %w(git ruby rvm bower debian node npm tmux)
  home "/home/#{node['chefs-gem']['user']}"
  theme          'steeef'
  autocorrect    false
  case_sensitive true
end
