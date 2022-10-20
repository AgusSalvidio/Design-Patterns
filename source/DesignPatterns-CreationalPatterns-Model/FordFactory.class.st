Class {
	#name : #FordFactory,
	#superclass : #CarPartFactory,
	#category : #'DesignPatterns-CreationalPatterns-Model-AbstractFactory'
}

{ #category : #'private - configuration' }
FordFactory >> configurePartCatalog [

	partCatalog
		at: #car put: FordCar new;
		at: #body put: FordBody new;
		at: #engine put: FordEngine new;
		yourself
]

{ #category : #'private - initialization' }
FordFactory >> initialize [ 

	super initialize. 
	self configurePartCatalog
]
