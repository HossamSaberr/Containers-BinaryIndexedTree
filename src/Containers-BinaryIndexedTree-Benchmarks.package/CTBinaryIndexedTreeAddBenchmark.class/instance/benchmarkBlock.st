benchmarking
benchmarkBlock
	^ [ 1 to: size do: [ :i | bit add: i at: i ] ]