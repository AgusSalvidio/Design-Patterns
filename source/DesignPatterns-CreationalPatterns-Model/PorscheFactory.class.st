Class {
	#name : #PorscheFactory,
	#superclass : #CarPartFactory,
	#category : #'DesignPatterns-CreationalPatterns-Model-AbstractFactory'
}

{ #category : #'private - configuration' }
PorscheFactory >> configurePartCatalog [

	partCatalog
		at: #car put: PorscheCar new;
		at: #body put: PorscheBody new;
		at: #engine put: PorscheEngine new;
		yourself
]

{ #category : #'private - initialization' }
PorscheFactory >> initialize [ 

	super initialize. 
	self configurePartCatalog
]
