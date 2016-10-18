group node['chefs-gem']['group']

user node['chefs-gem']['user'] do
  comment 'The default user of application'
  group node['chefs-gem']['group']
  shell '/usr/bin/zsh'
end
