tests
testAddAndPrefixSum
	bit add: 5 at: 1.
	bit add: 3 at: 2.
	bit add: 7 at: 3.
	
	self assert: (bit prefixSum: 1) equals: 5.
	self assert: (bit prefixSum: 2) equals: 8.
	self assert: (bit prefixSum: 3) equals: 15.
	self assert: (bit prefixSum: 10) equals: 15.