tests
testBuildFrom
	bit buildFrom: #(1 2 3 4 5 6 7 8 9 10).
	
	self assert: bit size equals: 10.
	self assert: (bit prefixSum: 5) equals: 15.
	self assert: (bit rangeSumFrom: 3 to: 7) equals: 25.