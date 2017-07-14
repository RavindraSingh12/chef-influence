#
# Cookbook:: env_concepts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/etc/motd' do 
  content 'this is a stage env'
end 
