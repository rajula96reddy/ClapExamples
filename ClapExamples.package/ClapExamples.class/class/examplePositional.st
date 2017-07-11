as yet unclassified
examplePositional
"Example using Positionals"
	<sampleInstance>
	| pos1 command context match|
	pos1 := (ClapPositional withName: 'inputFile').
	command := (ClapCommand withName: 'MyApp')
		addPositional: pos1. 
 context := ClapContext on: #('MyApp' 'input.txt').
	match := command matchOn: context.
	(match at:pos1) value. "Returns input.txt"
	^ match