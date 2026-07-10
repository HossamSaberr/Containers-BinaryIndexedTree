running
setUp
	super setUp.
	secondsInDay := 86400.
	bit := CTBinaryIndexedTree new: secondsInDay.
	random := Random new.