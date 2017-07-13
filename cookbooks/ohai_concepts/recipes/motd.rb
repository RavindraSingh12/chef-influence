hostname = node['hostname']

file '/etc/motd' do 
  content "hostname is #{hostname}"
end 

