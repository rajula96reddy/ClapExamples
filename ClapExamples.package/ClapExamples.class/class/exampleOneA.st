as yet unclassified
exampleOneA
"Example using Long name Flags"
	<sampleInstance>
	| flag1  pos1 subcommand1 flag2 command context match |
	flag1 := (ClapFlag withName: 'config') addPositional: (ClapPositional withName: 'FILE'); meaning: [ :flag | Path from: (flag atName: 'FILE') value ].
	flag2:= (ClapFlag withName: 'list') meaning: [ :flag | flag isMismatch not]. 
	pos1 := (ClapPositional withName: 'inputFile').
	subcommand1 := (ClapCommand withName: 'test') addFlag: flag2. 
	command := (ClapCommand withName: 'MyApp')
		addPositional: pos1 ; 
      addFlag: flag1;
		addSubcommand: subcommand1.
	context := ClapContext on: #('MyApp' 'input.txt' '--config' '/bar/abc' 'test' '--list').
	match := command matchOn: context.
	(match at:flag1) value. "Returns input.txt"
	(match at:pos1) value. "Returns Path / 'bar' / 'abc' "
	((match atName: 'test') at:flag2) value	. "Returns true"
	^ match