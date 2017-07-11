as yet unclassified
exampleOneB
 "Example using short name flags"
	<sampleInstance>
		| flag1 subcommand1 flag2 command context match|
		flag1 := (ClapFlag withName: 'config') addPositional: (ClapPositional withName: 'FILE'); meaning: [ :flag | Path from: (flag atName: 'FILE') value ].
	flag2:= (ClapFlag withName: 'list') meaning: [ :flag | flag isMismatch not]. 
	subcommand1 := (ClapCommand withName: 'test') addFlag: flag2. 
	command := (ClapCommand withName: 'MyApp')
	     addFlag: flag1;
		addSubcommand: subcommand1.
	context := ClapContext on: #('MyApp' '-c' '/bar/abc' 'test' '-l').
	match := command matchOn: context.
	(match at:flag1) value.
	((match atName: 'test') at:flag2) value	.
	^ match