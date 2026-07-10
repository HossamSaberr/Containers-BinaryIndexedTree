tests
testAtAndAtPut
	bit at: 2 put: 10.
	bit at: 3 put: 20.
	
	self assert: (bit at: 2) equals: 10.
	self assert: (bit prefixSum: 3) equals: 30.
	
	bit at: 2 put: 15.
	self assert: (bit at: 2) equals: 15.
	self assert: (bit prefixSum: 3) equals: 35.