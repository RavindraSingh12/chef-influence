#
# Cookbook:: ohai_concepts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#ohai is a cli utility which collects all the info about the node taken care
# by the chef so and adds all of this info the node object and stores this in 
#a json file on the server. and like here in this recipe we can use those 
#attributes in the recipe to make some decisons based on that info
if node['platform_family'] == "rhel"
  packageN = "httpd"
elsif node['platform_family'] == "debian"
  packageN = "apache2"
end

if node['platform_family'] == "debian"
  apt_update 'all platforms' do
    frequency 86400
    action :periodic
  end
end 

#packageN here is the variable that will get replaced depending on the type of platform. 
package 'apache2' do 
  package_name packageN
  action :install
end 

service 'apache2' do
  service_name 'httpd'
  action [:start, :enable]
end 

include_recipe 'ohai_concepts::website'  
