#
# Cookbook Name:: gitlabhq
# Recipe:: default
#
# Copyright 2013, Wide Eye Labs
#
# MIT License
#

%w{
  dependencies
  gitlab
}.each do |recipe|
  include_recipe "gitlabhq::#{recipe}"
end
