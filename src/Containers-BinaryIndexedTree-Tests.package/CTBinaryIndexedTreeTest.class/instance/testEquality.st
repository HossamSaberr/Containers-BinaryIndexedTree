tests
testEquality
	| bit2 |
	bit add: 1 at: 1.
	
	bit2 := CTBinaryIndexedTree new: 10.
	bit2 add: 1 at: 1.
	self assert: bit equals: bit2.
	
	bit2 add: 1 at: 2.
	self deny: bit equals: bit2.
	
	self deny: bit equals: (CTBinaryIndexedTree new: 5).
	
	self deny: bit equals: Object new.