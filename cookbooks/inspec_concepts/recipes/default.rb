#
# Cookbook:: inspec_concepts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

['net-tools','httpd'].each do |pkg|
  package pkg do 
    action :install
  end
end 
