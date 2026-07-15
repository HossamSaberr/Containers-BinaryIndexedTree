Class {
	#name : 'CTBinaryIndexedTreeAddBenchmark',
	#superclass : 'CTBinaryIndexedTreeAbstractBenchmark',
	#instVars : [
		'bit',
		'size'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'benchmarking' }
CTBinaryIndexedTreeAddBenchmark >> benchmarkBlock [
	^ [ 1 to: size do: [ :i | bit add: i at: i ] ]
]

{ #category : 'running' }
CTBinaryIndexedTreeAddBenchmark >> setUp [
	super setUp.
	size := 1000000.
	bit := CTBinaryIndexedTree new: size.
]
