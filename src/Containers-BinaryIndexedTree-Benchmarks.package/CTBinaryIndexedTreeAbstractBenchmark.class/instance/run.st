running
run
	self setUp.
	benchmarker blockToExecute: self benchmarkBlock.
	result := benchmarker benchmark.
	^ result