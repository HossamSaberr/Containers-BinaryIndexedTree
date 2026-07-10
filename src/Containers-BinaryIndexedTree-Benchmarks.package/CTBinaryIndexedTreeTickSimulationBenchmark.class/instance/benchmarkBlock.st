benchmarking
benchmarkBlock
	^ [
		1 to: 1000000 do: [ :i |
			| eventType |
			eventType := random next.
			eventType < 0.8
				ifTrue: [ 
					| tick volume |
					tick := (random next * (secondsInDay - 1)) asInteger + 1.
					volume := (random next * 1000) asInteger.
					bit add: volume at: tick ]
				ifFalse: [ 
					| startTick endTick temp |
					startTick := (random next * (secondsInDay - 1)) asInteger + 1.
					endTick := (random next * (secondsInDay - 1)) asInteger + 1.
					startTick > endTick ifTrue: [ 
						temp := startTick. startTick := endTick. endTick := temp ].
					bit rangeSumFrom: startTick to: endTick ]
		]
	]