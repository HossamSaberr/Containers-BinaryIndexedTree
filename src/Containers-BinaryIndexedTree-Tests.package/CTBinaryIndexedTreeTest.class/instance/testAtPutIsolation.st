tests
testAtPutIsolation
	bit at: 2 put: 10.
	
	self assert: (bit at: 1) equals: 0.
	self assert: (bit at: 3) equals: 0.
	
	self assert: (bit prefixSum: bit size) equals: 10.