tests
testInvalidRangeSum
	bit add: 5 at: 1.
	bit add: 10 at: 2.
	
	self should: [ bit rangeSumFrom: 2 to: 1 ] raise: Error.