accessing
at: anIndex
	"Retrieves the single absolute value at anIndex in O(log N)"
	^ self rangeSumFrom: anIndex to: anIndex