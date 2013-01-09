#
# Cookbook Name:: backup
# Recipe:: default
#
# Copyright 2011, Alastair Brunton
#
# MIT license
#

include_recipe "aws"
include_recipe "fog"

# in theory, only make will be needed for some of the gem installs (further below)
#include_recipe "build-essential"

# pre-install dep packages for gems
p = package "make" do
  action :nothing
end
p.run_action(:install)

p = package "libxslt-dev" do
  action :nothing
end
p.run_action(:install)

p = package "libxml2-dev" do
  action :nothing
end
p.run_action(:install)

# Install backup, s3sync, fog, mail, whenever
['backup', 's3sync', 'mail', 'whenever', 'popen4'].each do |rubygem|
 chef_gem rubygem
end

# create Backup directories
['Backup', 'Backup/config'].each do |dir|
  directory "#{`echo ~#{node['backup']['user']}`.strip}/#{dir}" do
    owner node['backup']['user']
  end
end

template "#{`echo ~#{node['backup']['user']}`.strip}/Backup/config.rb" do
  owner node['backup']['user']
  source "config.rb.erb"
  variables(:config => node[:backup])
end

# Whenever config setup.
template "#{`echo ~#{node['backup']['user']}`.strip}/Backup/config/schedule.rb" do
  owner node['backup']['user']
  source "schedule.rb.erb"
  variables(:config => node[:backup])
end

template "/etc/logrotate.d/whenever_log" do
  owner "root"
  source "logrotate.erb"
  variables(:backup_path => "#{`echo ~#{node['backup']['user']}`.strip}/Backup")
end