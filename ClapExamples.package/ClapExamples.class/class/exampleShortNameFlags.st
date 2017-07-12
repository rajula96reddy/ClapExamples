as yet unclassified
exampleShortNameFlags
"Example using Short name Flags"
	<sampleInstance>
	| flag1 command context match |
	flag1 := (ClapFlag withName: 'config').
	command := (ClapCommand withName: 'MyApp') addFlag: flag1.
	context := ClapContext on: #('MyApp' '-c').
	match := command matchOn: context.
	^ match