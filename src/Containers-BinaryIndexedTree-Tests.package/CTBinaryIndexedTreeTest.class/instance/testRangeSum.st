tests
testRangeSum
	bit add: 2 at: 1.
	bit add: 4 at: 2.
	bit add: 6 at: 3.
	bit add: 8 at: 4.
	
	self assert: (bit rangeSumFrom: 2 to: 4) equals: 18.
	self assert: (bit rangeSumFrom: 1 to: 3) equals: 12.
	self assert: (bit rangeSumFrom: 3 to: 3) equals: 6.