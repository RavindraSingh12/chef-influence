# chef_phases

TODO: Local Cookbook development concepts.

These cookbooks are generated by our generator lcd_origin

Which we created using "chef generate generator "generator/<name>"

---------------------------------------------------------------

A Chef run works in two phases, which ultimately result in establishing our desires state.

	*Compile Phase
	*Execution Phase

------------------------------------------------------------

The Compile Phase:- 

Each resource in the node object is identified and a resource collection is built.All recipes from the run_list are loaded, and then the actions specified within  each of them are identified.

*During complie phase:
	~ All cookbooks are loaded from the run list.
	~ Recipes are read and used to build the resource collection.
	~ Pure Ruby code is executed
		~ Variable get used
		~ Array get iterated
		~ Conditionals get evaluated

ruby code is executing here because if there is anything comes out which will be used to make the runlist than this should happen here.
______________________________________________________________

The Execution Phase

The chef-client configures the system based on the order of the resources in the resource colleciton. Each resource is mapped to a provider which examines  the node and performs the necessary steps to complete actions.

*During the execution phase:
	~ Chef DSL is executed.
	~ Any Ruby inside of a ruby_block resource is executed.
	~ Guards like not_if and only_if are evaluated during the execution phase.
	~ Property values using lazy evaluation are executed.

Under normal circumstances, resource parametes must be set at complie time, but sometimes a value can't be known until the execution phase. when this is the case, a lazy block can be used to have them evaluated dusring execution time.

avoid using pure Ruby code to check for things which haven't yet been executed. Instead use guards like not_if and only_if which are evaluated during the execution phase.

There is another execption to standard behavior, the chef_gem resource runs its actions immediately, before convergence allowing a gem to be used in a recipe immediately.


Run Action: -

Another method to run something in the compile phase is to use the .run_action(:some_action) method at the end of a resource block to run the specified action during the compile phase.

Action should be set to nothing to prevent execution in the execution phase.
	execute 'yum-makecache' do
	  command 'yum makecache''
	  action :nothing
	end 

Resources that are executed during the compile phase cannot notify resources.
