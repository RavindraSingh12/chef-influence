#
# Cookbook:: roles_concept
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'postgresql-server' do
  notifies :run, 'execute[postgresql-init]', :immediately
end

execute 'postgresql-init' do
  command 'postgresql-setup initdb'
  action :nothing 
end

service 'postgresql' do
  action [:enable, :start]
end

#search[index, key], this can result in ore then one results
webnodes = search('node', 'role:web')

#this is a ruby for each
webnodes.each do |node|
  puts node
end
