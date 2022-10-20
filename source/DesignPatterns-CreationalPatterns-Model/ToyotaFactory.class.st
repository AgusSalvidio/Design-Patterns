Class {
	#name : #ToyotaFactory,
	#superclass : #CarPartFactory,
	#category : #'DesignPatterns-CreationalPatterns-Model-AbstractFactory'
}

{ #category : #'private - configuration' }
ToyotaFactory >> configurePartCatalog [

	partCatalog
		at: #car put: ToyotaCar new;
		at: #body put: ToyotaBody new;
		at: #engine put: ToyotaEngine new;
		yourself
]

{ #category : #'private - initialization' }
ToyotaFactory >> initialize [ 

	super initialize. 
	self configurePartCatalog
]
