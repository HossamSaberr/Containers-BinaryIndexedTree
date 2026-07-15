Class {
	#name : 'CTBinaryIndexedTreeLeaderboardBenchmark',
	#superclass : 'CTBinaryIndexedTreeAbstractBenchmark',
	#instVars : [
		'bit',
		'maxScore',
		'random'
	],
	#category : 'Containers-BinaryIndexedTree-Benchmarks',
	#package : 'Containers-BinaryIndexedTree-Benchmarks'
}

{ #category : 'benchmarking' }
CTBinaryIndexedTreeLeaderboardBenchmark >> benchmarkBlock [
	^ [
		1 to: 500000 do: [ :i |
			(i \\ 3 = 0)
				ifTrue: [ 
					bit prefixSum: ((random next * (maxScore - 1)) asInteger + 1) ]
				ifFalse: [ 
					| score |
					score := ((random next * (maxScore - 1)) asInteger + 1).
					bit add: -1 at: score.
					bit add: 1 at: score ]
		]
	]
]

{ #category : 'running' }
CTBinaryIndexedTreeLeaderboardBenchmark >> setUp [
	super setUp.
	maxScore := 1000000.
	bit := CTBinaryIndexedTree new: maxScore.
	random := Random new.
	
	"Pre populate the server with 100,000 active players distributed randomly"
	1 to: 100000 do: [ :i | 
		bit add: 1 at: ((random next * (maxScore - 1)) asInteger + 1) 
	].
]
