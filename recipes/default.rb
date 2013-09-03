#
# Cookbook Name:: gitlabhq
# Recipe:: default
#
# Copyright 2013, Wide Eye Labs
#
# MIT License
#

%w{
  gitlabhq::dependencies
  gitlabhq::git
  gitlabhq::gitlab_users
  gitlabhq::gitlab_shell
  gitlabhq::database
  gitlabhq::gitlab
  gitlabhq::nginx
  gitlabhq::backup
}.each do |recipe|
  include_recipe recipe
end

if node[:gitlab][:ci][:ci_enabled]
  include_recipe 'gitlabhq::ci'
end
