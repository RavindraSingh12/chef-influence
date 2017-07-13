# here resource name and package is 'apache',
# Error executing action `install` on resource 'yum_package[apache]',
# this error will thrown to us right
# now becuase right now the package name and the resource name is same

# package 'apache' do
# end

# default action is install on package recource

package 'apache' do
  package_name 'httpd'
end

# default action on the service resource is nothing.
service 'httpd' do
  action [:enable, :start]
end

# default action for file resource is create
file '/var/www/index.html' do
  action :delete
end

file '/var/www/html/index.html' do
  content 'Hello world!'
  mode '0755'
  owner 'root'
  group 'apache'
end


