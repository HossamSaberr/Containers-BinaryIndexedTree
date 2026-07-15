Class {
	#name : 'CTBinaryIndexedTreePrefixSumBenchmark',
	#superclass : 'CTBinaryIndexedTreeAbstractBenchmark',
	#instVars : [
		'bit',
		'size'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'benchmarking' }
CTBinaryIndexedTreePrefixSumBenchmark >> benchmarkBlock [
	^ [ 1 to: size do: [ :i | bit prefixSum: i ] ]
]

{ #category : 'running' }
CTBinaryIndexedTreePrefixSumBenchmark >> setUp [
	super setUp.
	size := 1000000.
	bit := CTBinaryIndexedTree new: size.
	"Fill the tree first so the block strictly benchmarks queries"
	1 to: size do: [ :i | bit add: i at: i ].
]
