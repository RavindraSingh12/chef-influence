#
# Cookbook:: code_analysis_tools
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd' do  
  action :install 
end 

file '/etc/motd' do 
  content 'my name is ravindra singh welcome guri ljsdfklsdflksjdfklskjlfkdslf'
end 
