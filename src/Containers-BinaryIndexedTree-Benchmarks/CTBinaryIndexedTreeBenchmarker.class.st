Class {
	#name : 'CTBinaryIndexedTreeBenchmarker',
	#superclass : 'Object',
	#instVars : [
		'block'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'benchmarking' }
CTBinaryIndexedTreeBenchmarker >> benchmark [
	| executionTime fullGCTime incrementalGCTime |
	
	fullGCTime := Smalltalk vm totalFullGCTime.
	incrementalGCTime := Smalltalk vm totalIncrementalGCTime.
	executionTime := Time primUTCMicrosecondsClock.

	block value.
	
	executionTime := Time primUTCMicrosecondsClock - executionTime.
	fullGCTime := (Smalltalk vm totalFullGCTime - fullGCTime) * 1000.
	incrementalGCTime := (Smalltalk vm totalIncrementalGCTime - incrementalGCTime) * 1000.

	^ CTBinaryIndexedTreeBenchmarkerResult new
		  executionTime: executionTime;
		  fullGCTime: fullGCTime;
		  incrementalGCTime: incrementalGCTime;
		  yourself
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarker >> blockToExecute: aBlock [
	block := aBlock
]
