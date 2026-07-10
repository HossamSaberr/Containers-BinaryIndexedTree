tests
testAtDefaultValues
	1 to: bit size do: [ :i | 
		self assert: (bit at: i) equals: 0 
	].