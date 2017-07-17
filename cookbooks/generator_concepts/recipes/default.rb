#
# Cookbook:: generator_concepts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'
package 'httpd' do
  action :install
end

service 'httpd' do
  action [:enable, :start]
end
