as yet unclassified
exampleSubCommand
"Example using subCommands"
	<sampleInstance>
	| flag subcommand command context match |
	flag:= (ClapFlag withName: 'list') meaning: [ :value | value isMismatch not]. 
	subcommand := (ClapCommand withName: 'test') addFlag: flag. 
	command := (ClapCommand withName: 'MyApp') addSubcommand: subcommand.
	context := ClapContext on: #('MyApp' 'test' '--list').
	match := command matchOn: context.
	((match atName: 'test') at:flag) value. "Returns true"
	^ match