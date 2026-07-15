Class {
	#name : 'BaselineOfContainersBinaryIndexedTree',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfContainersBinaryIndexedTree',
	#package : 'BaselineOfContainersBinaryIndexedTree'
}

{ #category : 'baselines' }
BaselineOfContainersBinaryIndexedTree >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'Containers-BinaryIndexedTree'.
		
		spec 
			package: 'Containers-BinaryIndexedTree-Tests' 
			with: [ spec requires: #('Containers-BinaryIndexedTree') ].
			
		spec 
			package: 'Containers-BinaryIndexedTree-Benchmarks' 
			with: [ spec requires: #('Containers-BinaryIndexedTree') ].

		spec 
			group: 'Core' with: #('Containers-BinaryIndexedTree');
			group: 'Tests' with: #('Containers-BinaryIndexedTree-Tests');
			group: 'Benchmarks' with: #('Containers-BinaryIndexedTree-Benchmarks');
			group: 'default' with: #('Core' 'Tests' 'Benchmarks')
	]
]
