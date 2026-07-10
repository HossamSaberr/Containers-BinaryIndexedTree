running
setUp
	super setUp.
	maxScore := 1000000.
	bit := CTBinaryIndexedTree new: maxScore.
	random := Random new.
	
	"Pre populate the server with 100,000 active players distributed randomly"
	1 to: 100000 do: [ :i | 
		bit add: 1 at: ((random next * (maxScore - 1)) asInteger + 1) 
	].