benchmarks
runPrefixSumStressTest
	| benchmarker result bit size |
	size := 1000000.
	bit := CTBinaryIndexedTree new: size.
	"Fill the tree first so we only benchmark the queries"
	1 to: size do: [ :i | bit add: i at: i ].
	
	benchmarker := CTBinaryIndexedTreeBenchmarker new.
	benchmarker blockToExecute: [
		1 to: size do: [ :i |
			bit prefixSum: i ]
	].
	
	result := benchmarker benchmark.
	^ result