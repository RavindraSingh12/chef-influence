# env_concepts

TODO: Enter the cookbook description here.

here we r understanding environment concept in chef we have this cookbook
with two versions of it 0.1.0, 0.2.0.

our 50.50.50.128, prod server is running "0.1.0" and
50.50.50.212, staging server is running "0.2.0"

and we are doing this using environments. we will put both the nodes in these two envs then add role webserver to them.

while adding environment we specify the cookbook version this env should run.

for example role webserver will have this env_concept cookbook but in roles we cnt specify version of the cookbook we do this 
in envs.

so when we put nodes in stage or prod or any environment than that node will may run the same role but the version of that cookbook will be 
environment specific.
