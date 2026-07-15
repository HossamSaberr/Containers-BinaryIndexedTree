Class {
	#name : 'CTBinaryIndexedTreeBenchmarkerResult',
	#superclass : 'Object',
	#instVars : [
		'executionTime',
		'fullGCTime',
		'incrementalGCTime'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> executionTime [
	^ executionTime
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> executionTime: anInteger [
	executionTime := anInteger
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> fullGCTime [
	^ fullGCTime
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> fullGCTime: anInteger [
	fullGCTime := anInteger
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> incrementalGCTime [
	^ incrementalGCTime
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> incrementalGCTime: anInteger [
	incrementalGCTime := anInteger
]

{ #category : 'accessing' }
CTBinaryIndexedTreeBenchmarkerResult >> relativeGCTime [
	executionTime = 0 ifTrue: [ ^ '0.00 %' ].
	^ (((fullGCTime + incrementalGCTime) / executionTime * 100) asFloat
		   printShowingDecimalPlaces: 2) , ' %'
]
