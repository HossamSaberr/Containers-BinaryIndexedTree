comparing
= anObject
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ size = anObject size and: [ tree = anObject tree ]