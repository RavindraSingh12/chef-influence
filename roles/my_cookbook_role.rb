name "my_cookbook_role"
description "role dedicated to my_cookbook"
run_list "recipe[my_cookbook]"
default_attributes "my_cookbook" => { "message" => "Hallo Welt!" }
