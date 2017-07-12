as yet unclassified
examplePositionalPresence
 "Example using positionals to check its presence"
	<sampleInstance>
	| flag1 command context match |
	flag1 := (ClapFlag withName: 'test') addPositional: (ClapPositional withName: 'list'); meaning: [ :flag | flag isMismatch not ].
	command := (ClapCommand withName: 'MyApp') addFlag: flag1.
	context := ClapContext on: #('MyApp' '-t' 'list').
	match := command matchOn: context.
	(match at:flag1) value. "Returns true"
	^ match