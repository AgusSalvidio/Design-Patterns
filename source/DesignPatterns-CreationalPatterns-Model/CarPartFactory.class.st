Class {
	#name : #CarPartFactory,
	#superclass : #Object,
	#instVars : [
		'partCatalog'
	],
	#category : #'DesignPatterns-CreationalPatterns-Model-AbstractFactory'
}

{ #category : #'instance creation' }
CarPartFactory class >> new [

	^ self basicNew initialize
]

{ #category : #'private - accessing' }
CarPartFactory >> carPartBasedOn: aCarPartType [

	^ partCatalog
		  at: aCarPartType
		  ifAbsent: [ self signalNotFound: aCarPartType ]
]

{ #category : #initialization }
CarPartFactory >> initialize [

	partCatalog := Dictionary new
]

{ #category : #making }
CarPartFactory >> make: aCarPartType [

	"Create a new part based on carPartType. -asalvidio"
	
	^ self carPartBasedOn: aCarPartType
	
]

{ #category : #'private - signaling' }
CarPartFactory >> signalNotFound: aCarPartType [

	^ ObjectNotFound signal: ('There''s no object bound to <1s>' expandMacrosWith: aCarPartType)
]
