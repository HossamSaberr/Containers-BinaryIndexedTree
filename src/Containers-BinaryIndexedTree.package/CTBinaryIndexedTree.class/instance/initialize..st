initialization
initialize: anInteger
	super initialize.
	size := anInteger.
	tree := Array new: size withAll: 0.