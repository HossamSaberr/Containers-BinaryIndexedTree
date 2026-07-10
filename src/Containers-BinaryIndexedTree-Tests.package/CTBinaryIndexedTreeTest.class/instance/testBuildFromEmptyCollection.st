tests
testBuildFromEmptyCollection
	| emptyBit |
	emptyBit := CTBinaryIndexedTree new.
	emptyBit buildFrom: #().
	
	self assert: emptyBit size equals: 0.
	self assert: emptyBit isEmpty.