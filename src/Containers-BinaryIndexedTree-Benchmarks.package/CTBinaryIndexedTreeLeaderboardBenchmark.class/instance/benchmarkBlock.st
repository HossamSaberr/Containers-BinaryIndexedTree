benchmarking
benchmarkBlock
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