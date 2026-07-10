benchmarks
runAddStressTest
	| benchmarker result bit size |
	size := 1000000.
	bit := CTBinaryIndexedTree new: size.
	
	benchmarker := CTBinaryIndexedTreeBenchmarker new.
	benchmarker blockToExecute: [
		1 to: size do: [ :i |
			bit add: i at: i ]
	].
	
	result := benchmarker benchmark.
	^ result