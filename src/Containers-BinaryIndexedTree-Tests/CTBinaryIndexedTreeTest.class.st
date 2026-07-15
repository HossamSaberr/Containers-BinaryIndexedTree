Class {
	#name : 'CTBinaryIndexedTreeTest',
	#superclass : 'TestCase',
	#instVars : [
		'bit'
	],
	#category : 'Containers-BinaryIndexedTree-Tests',
	#package : 'Containers-BinaryIndexedTree-Tests'
}

{ #category : 'running' }
CTBinaryIndexedTreeTest >> setUp [
	super setUp.
	bit := CTBinaryIndexedTree new: 10.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testAddAndPrefixSum [
	bit add: 5 at: 1.
	bit add: 3 at: 2.
	bit add: 7 at: 3.
	
	self assert: (bit prefixSum: 1) equals: 5.
	self assert: (bit prefixSum: 2) equals: 8.
	self assert: (bit prefixSum: 3) equals: 15.
	self assert: (bit prefixSum: 10) equals: 15.
]

{ #category : 'accessing' }
CTBinaryIndexedTreeTest >> testAsArrayReturnsLogicalValues [
	| initialArray |
	
	initialArray := #(5 2 9 1 7 4).
	bit buildFrom: initialArray.
	self assert: bit asArray equals: initialArray asArray.
	
	bit add: 3 at: 2. 
	self assert: bit asArray equals: #(5 5 9 1 7 4).
	
	bit at: 4 put: 10.
	self assert: bit asArray equals: #(5 5 9 10 7 4).
	
	self deny: bit asArray equals: bit tree.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testAtAndAtPut [
	bit at: 2 put: 10.
	bit at: 3 put: 20.
	
	self assert: (bit at: 2) equals: 10.
	self assert: (bit prefixSum: 3) equals: 30.
	
	bit at: 2 put: 15.
	self assert: (bit at: 2) equals: 15.
	self assert: (bit prefixSum: 3) equals: 35.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testAtDefaultValues [
	1 to: bit size do: [ :i | 
		self assert: (bit at: i) equals: 0 
	].
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testAtPutIsolation [
	bit at: 2 put: 10.
	
	self assert: (bit at: 1) equals: 0.
	self assert: (bit at: 3) equals: 0.
	
	self assert: (bit prefixSum: bit size) equals: 10.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testBuildFrom [
	bit buildFrom: #(1 2 3 4 5 6 7 8 9 10).
	
	self assert: bit size equals: 10.
	self assert: (bit prefixSum: 5) equals: 15.
	self assert: (bit rangeSumFrom: 3 to: 7) equals: 25.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testBuildFromEmptyCollection [
	| emptyBit |
	emptyBit := CTBinaryIndexedTree new.
	emptyBit buildFrom: #().
	
	self assert: emptyBit size equals: 0.
	self assert: emptyBit isEmpty.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testEquality [
	| bit2 |
	bit add: 1 at: 1.
	
	bit2 := CTBinaryIndexedTree new: 10.
	bit2 add: 1 at: 1.
	self assert: bit equals: bit2.
	
	bit2 add: 1 at: 2.
	self deny: bit equals: bit2.
	
	self deny: bit equals: (CTBinaryIndexedTree new: 5).
	
	self deny: bit equals: Object new.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testHash [
	| bit2 |
	bit add: 1 at: 1.
	
	bit2 := CTBinaryIndexedTree new: 10.
	bit2 add: 1 at: 1.
	
	self assert: bit hash equals: bit2 hash.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testInvalidRangeSum [
	bit add: 5 at: 1.
	bit add: 10 at: 2.
	
	self should: [ bit rangeSumFrom: 2 to: 1 ] raise: Error.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testOutOfBounds [
	self should: [ bit add: 5 at: 11 ] raise: SubscriptOutOfBounds.
	self should: [ bit add: 5 at: 0 ] raise: SubscriptOutOfBounds.
	self should: [ bit prefixSum: 11 ] raise: SubscriptOutOfBounds.
]

{ #category : 'tests' }
CTBinaryIndexedTreeTest >> testRangeSum [
	bit add: 2 at: 1.
	bit add: 4 at: 2.
	bit add: 6 at: 3.
	bit add: 8 at: 4.
	
	self assert: (bit rangeSumFrom: 2 to: 4) equals: 18.
	self assert: (bit rangeSumFrom: 1 to: 3) equals: 12.
	self assert: (bit rangeSumFrom: 3 to: 3) equals: 6.
]
