operations
add: aValue at: anIndex
	"Adds aValue to the element at anIndex and updates the tree in O(log N)"
	| currentIndex |
	(anIndex between: 1 and: size) ifFalse: [ SubscriptOutOfBounds signalFor: anIndex ].
	
	currentIndex := anIndex.
	[ currentIndex <= size ] whileTrue: [
		tree at: currentIndex put: (tree at: currentIndex) + aValue.
		currentIndex := currentIndex + (currentIndex bitAnd: currentIndex negated)
	]