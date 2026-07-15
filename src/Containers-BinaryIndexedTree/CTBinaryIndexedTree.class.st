Class {
	#name : 'CTBinaryIndexedTree',
	#superclass : 'Object',
	#instVars : [
		'tree',
		'size'
	],
	#category : 'Containers-BinaryIndexedTree',
	#package : 'Containers-BinaryIndexedTree'
}

{ #category : 'instance creation' }
CTBinaryIndexedTree class >> new: anInteger [
	^ self basicNew initialize: anInteger
]

{ #category : 'comparing' }
CTBinaryIndexedTree >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ size = anObject size and: [ tree = anObject tree ]
]

{ #category : 'operations' }
CTBinaryIndexedTree >> add: aValue at: anIndex [
	"Adds aValue to the element at anIndex and updates the tree in O(log N)"
	| currentIndex |
	(anIndex between: 1 and: size) ifFalse: [ SubscriptOutOfBounds signalFor: anIndex ].
	
	currentIndex := anIndex.
	[ currentIndex <= size ] whileTrue: [
		tree at: currentIndex put: (tree at: currentIndex) + aValue.
		currentIndex := currentIndex + (currentIndex bitAnd: currentIndex negated)
	]
]

{ #category : 'accessing' }
CTBinaryIndexedTree >> asArray [
	| array parentIndex |
	
	array := tree copy.
	
	size to: 1 by: -1 do: [ :i |
		parentIndex := i + (i bitAnd: i negated).
		parentIndex <= size ifTrue: [ 
			array at: parentIndex put: (array at: parentIndex) - (array at: i)
		]
	].
	
	^ array
]

{ #category : 'accessing' }
CTBinaryIndexedTree >> at: anIndex [
	"Retrieves the single absolute value at anIndex in O(log N)"
	^ self rangeSumFrom: anIndex to: anIndex
]

{ #category : 'accessing' }
CTBinaryIndexedTree >> at: anIndex put: aValue [
	"Sets the absolute value at anIndex. Calculates the difference and adds it."
	| difference |
	difference := aValue - (self at: anIndex).
	self add: difference at: anIndex.
	^ aValue
]

{ #category : 'initialization' }
CTBinaryIndexedTree >> buildFrom: aCollection [
	"Optimized Approach: Builds the Binary Indexed Tree in O(N) time"
	| parentIndex |
	size := aCollection size.
	
	"Copy and isolate the initial values"
	tree := aCollection asArray copy.
	
	"Propagate values to their immediate parent in the tree"
	1 to: size do: [ :i |
		parentIndex := i + (i bitAnd: i negated).
		parentIndex <= size ifTrue: [ 
			tree at: parentIndex put: (tree at: parentIndex) + (tree at: i)
		]
	].
]

{ #category : 'comparing' }
CTBinaryIndexedTree >> hash [
	^ size class hash bitXor: tree hash
]

{ #category : 'testing' }
CTBinaryIndexedTree >> ifEmpty: aBlock ifNotEmpty: anotherBlock [
	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ anotherBlock value ]
]

{ #category : 'initialization' }
CTBinaryIndexedTree >> initialize [
	super initialize.
	size := 0.
	tree := Array new.
]

{ #category : 'initialization' }
CTBinaryIndexedTree >> initialize: anInteger [
	super initialize.
	size := anInteger.
	tree := Array new: size withAll: 0.
]

{ #category : 'testing' }
CTBinaryIndexedTree >> isEmpty [
	^ size = 0
]

{ #category : 'testing' }
CTBinaryIndexedTree >> isNotEmpty [
	^ self isEmpty not
]

{ #category : 'operations' }
CTBinaryIndexedTree >> prefixSum: anIndex [
	"Returns the sum of elements from index 1 to anIndex in O(log N)"
	| sum currentIndex |
	anIndex = 0 ifTrue: [ ^ 0 ].
	(anIndex between: 1 and: size) ifFalse: [ SubscriptOutOfBounds signalFor: anIndex ].
	
	sum := 0.
	currentIndex := anIndex.
	[ currentIndex > 0 ] whileTrue: [
		sum := sum + (tree at: currentIndex).
		currentIndex := currentIndex - (currentIndex bitAnd: currentIndex negated)
	].
	^ sum
]

{ #category : 'operations' }
CTBinaryIndexedTree >> rangeSumFrom: leftIndex to: rightIndex [
	"Returns the sum of elements between leftIndex and rightIndex inclusive"
	(leftIndex between: 1 and: rightIndex) ifFalse: [ self error: 'Invalid range bounds' ].
	(rightIndex <= size) ifFalse: [ SubscriptOutOfBounds signalFor: rightIndex ].
	
	^ (self prefixSum: rightIndex) - (self prefixSum: leftIndex - 1)
]

{ #category : 'accessing' }
CTBinaryIndexedTree >> size [
	^ size
]

{ #category : 'accessing' }
CTBinaryIndexedTree >> tree [
	^ tree
]
