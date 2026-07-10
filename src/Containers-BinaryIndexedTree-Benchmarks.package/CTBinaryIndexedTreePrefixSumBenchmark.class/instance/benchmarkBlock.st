benchmarking
benchmarkBlock
	^ [ 1 to: size do: [ :i | bit prefixSum: i ] ]