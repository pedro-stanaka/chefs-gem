#
# Cookbook Name:: chefs_gem
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chefs_gem::bootstraping"
include_recipe 'chefs_gem::user'
include_recipe 'chefs_gem::ruby'
include_recipe 'chefs_gem::database'
include_recipe 'chefs_gem::utilities'

