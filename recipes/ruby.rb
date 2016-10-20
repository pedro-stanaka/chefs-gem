



package 'Rubies source deps' do
  action :install
  package_name %w(libffi-dev bison automake libxml2-dev)
  only_if { platform?('ubuntu') }
end

include_recipe "rvm::user"
