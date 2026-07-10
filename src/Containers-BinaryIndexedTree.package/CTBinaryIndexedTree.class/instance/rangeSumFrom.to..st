operations
rangeSumFrom: leftIndex to: rightIndex
	"Returns the sum of elements between leftIndex and rightIndex inclusive"
	(leftIndex between: 1 and: rightIndex) ifFalse: [ self error: 'Invalid range bounds' ].
	(rightIndex <= size) ifFalse: [ SubscriptOutOfBounds signalFor: rightIndex ].
	
	^ (self prefixSum: rightIndex) - (self prefixSum: leftIndex - 1)