as yet unclassified
exampleLongNameFlags
"Example using Long name Flags"
	<sampleInstance>
	| flag1 command context match|
		flag1 := (ClapFlag withName: 'config').
	command := (ClapCommand withName: 'MyApp')
      addFlag: flag1.
	context := ClapContext on: #('MyApp' '--config').
	match := command matchOn: context.
	^ match