tests
testHash
	| bit2 |
	bit add: 1 at: 1.
	
	bit2 := CTBinaryIndexedTree new: 10.
	bit2 add: 1 at: 1.
	
	self assert: bit hash equals: bit2 hash.