operations
prefixSum: anIndex
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