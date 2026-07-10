accessing
at: anIndex put: aValue
	"Sets the absolute value at anIndex. Calculates the difference and adds it."
	| difference |
	difference := aValue - (self at: anIndex).
	self add: difference at: anIndex.
	^ aValue