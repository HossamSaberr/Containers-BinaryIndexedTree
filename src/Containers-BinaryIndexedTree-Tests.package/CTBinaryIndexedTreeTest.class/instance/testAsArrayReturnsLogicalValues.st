accessing
testAsArrayReturnsLogicalValues
	| initialArray |
	
	initialArray := #(5 2 9 1 7 4).
	bit buildFrom: initialArray.
	self assert: bit asArray equals: initialArray asArray.
	
	bit add: 3 at: 2. 
	self assert: bit asArray equals: #(5 5 9 1 7 4).
	
	bit at: 4 put: 10.
	self assert: bit asArray equals: #(5 5 9 10 7 4).
	
	self deny: bit asArray equals: bit tree.