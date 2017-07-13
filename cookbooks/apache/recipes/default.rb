#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# install apache package where apache2 is resource name and package name is httpd
package 'apache2' do
  package_name 'httpd'
  action :install
end
# start and enable the package
service 'apache2' do
  service_name 'httpd'
  action [:start, :enable]
end

#we can include all other recipes here in default recipe 
#include_recipe 'apache::websites'
#but if we don't want to do this we can add recipes drectly in the nodes runlist

