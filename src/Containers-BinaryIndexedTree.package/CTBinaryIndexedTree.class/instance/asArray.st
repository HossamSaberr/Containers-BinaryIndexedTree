accessing
asArray
	| array parentIndex |
	
	array := tree copy.
	
	size to: 1 by: -1 do: [ :i |
		parentIndex := i + (i bitAnd: i negated).
		parentIndex <= size ifTrue: [ 
			array at: parentIndex put: (array at: parentIndex) - (array at: i)
		]
	].
	
	^ array