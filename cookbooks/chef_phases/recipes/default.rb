#
# Cookbook:: chef_phases
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

nagiosIP = []

search(:node, "ipaddress:*").each do |ip|
  file '/etc/motd' do 
    content '#{ip}'
  end
end


lazy_message = 'Hello World'

file 'lazy_message' do 
  path '/tmp/lazy.txt'
  content "#{lazy_message}"
end 

execute 'yum-makecache' do 
  command 'yum makecache'
  notifies :create, 'file[message]', :immediately
  action :nothing
end 

package 'bind-utils' do 
  action :install 
  notifies :run, 'execute[yum-makecache]', :before
end 

file 'message' do 
  path '/tmp/message.txt'
  content lazy{ "#{lazy_message}" }
end 

lazy_message = 'Good Bye world'
