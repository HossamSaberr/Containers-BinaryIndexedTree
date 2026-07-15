Class {
	#name : 'CTBinaryIndexedTreeAbstractBenchmark',
	#superclass : 'Object',
	#instVars : [
		'benchmarker',
		'result'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'benchmarking' }
CTBinaryIndexedTreeAbstractBenchmark >> benchmarkBlock [
	^ self subclassResponsibility
]

{ #category : 'running' }
CTBinaryIndexedTreeAbstractBenchmark >> run [
	self setUp.
	benchmarker blockToExecute: self benchmarkBlock.
	result := benchmarker benchmark.
	^ result
]

{ #category : 'running' }
CTBinaryIndexedTreeAbstractBenchmark >> setUp [
	benchmarker := CTBinaryIndexedTreeBenchmarker new.
]
