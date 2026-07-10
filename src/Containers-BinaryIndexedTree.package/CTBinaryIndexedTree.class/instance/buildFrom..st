initialization
buildFrom: aCollection
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