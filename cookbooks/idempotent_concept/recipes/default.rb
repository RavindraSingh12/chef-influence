#
# Cookbook:: idempotent_concept
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#use only_if and not_if guards to make resource idempotent 

file '/etc/motd' do
  content 'welcome'
end

#only_if executes a resource when a certain condition provided is met
execute 'only_if' do 
  command 'echo uptodate >> /etc/motd'
  only_if 'test -r /etc/motd'
end 

#not_if prevents a resource when a certain condition is met
execute 'not_if' do 
  command 'echo not_if >> /etc/motd'
  not_if 'test -r /etc/motd'
end

#this file exists check can be run with the help of ruby  code tooi
#just to tell that hey we r using ruby function thrw :: in front of the File class 
execute 'ruby check' do 
  command 'echo ruby >> /etc/motd'
  only_if { ::File.exists?('/etc/motd') }
end
