Vagrant.configure("2") do |config| 
  config.vm.box = "opscode-ubuntu-16.04" 
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-16.04_chef-provisionerless.box" 
  config.omnibus.chef_version = :latest  

 config.vm.provision :chef_client do |chef|   
   chef.provisioning_path = "/etc/chef"   
   chef.chef_server_url = "https://api.chef.io/organizations/kt_chef"  
   chef.validation_key_path = ".chef/ravindrasinghk.pem"   
   chef.validation_client_name = "ravindrasinghk"   
   chef.node_name = "vagrantserver1" 
 end
end
