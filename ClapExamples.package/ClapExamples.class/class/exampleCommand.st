as yet unclassified
exampleCommand
"Example using Positionals"
	<sampleInstance>
	| command context match |
	command := (ClapCommand withName: 'MyApp').
   context := ClapContext on: #('MyApp').
	match := command matchOn: context.
	^match