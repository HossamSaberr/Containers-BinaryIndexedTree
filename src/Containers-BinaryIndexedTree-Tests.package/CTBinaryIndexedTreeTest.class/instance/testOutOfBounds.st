tests
testOutOfBounds
	self should: [ bit add: 5 at: 11 ] raise: SubscriptOutOfBounds.
	self should: [ bit add: 5 at: 0 ] raise: SubscriptOutOfBounds.
	self should: [ bit prefixSum: 11 ] raise: SubscriptOutOfBounds.