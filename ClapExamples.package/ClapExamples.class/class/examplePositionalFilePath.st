as yet unclassified
examplePositionalFilePath
 "Example using file path as positional"
	<sampleInstance>
	| flag1 command context match |
	flag1 := (ClapFlag withName: 'config') addPositional: (ClapPositional withName: 'FILE'); meaning: [ :flag | Path from: (flag atName: 'FILE') value ].
	command := (ClapCommand withName: 'MyApp') addFlag: flag1.
	context := ClapContext on: #('MyApp' '-c' '/bar/abc').
	match := command matchOn: context.
	(match at:flag1) value. "Returns Path / 'bar' / 'abc' "
	^ match