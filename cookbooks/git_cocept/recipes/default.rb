#
# Cookbook:: git_cocept
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search(:node, 'environment:_default',
       filter_result: { 'name' => ['name'],
                        'ip' => ['ipaddress'],
                        'kernel_version' => %w(kernel version) }).each do |result|
  puts result['name']
  puts result['ip']
  puts result['kernel_version']
 
  node[git_concept]['ips'] = result['ip']
end

file '/etc/motd' do 
  content node['git_concept']['ips']
end
