Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'parts'
	],
	#category : #'DesignPatterns-CreationalPatterns-Model-Base'
}

{ #category : #'instance creation' }
Car class >> new [

	^ self basicNew initialize
]

{ #category : #'private - adding' }
Car >> add: aCarPart [

	self parts at: aCarPart type put: aCarPart
]

{ #category : #accessing }
Car >> hasAlreadyInstalled: aCarPart [

	^ self parts includes: aCarPart
]

{ #category : #accessing }
Car >> hasBody [

	^ self parts includesKey: 'Body'
]

{ #category : #accessing }
Car >> hasEngine [

	^ self parts includesKey: 'Engine'
]

{ #category : #'private - initialization' }
Car >> initialize [

	parts := Dictionary new
]

{ #category : #accessing }
Car >> parts [
	
	^ parts 
]

{ #category : #accessing }
Car >> updateCarPartWith: anUpdatedCarPart [

	self parts
		at: anUpdatedCarPart type
		update: [ :part | anUpdatedCarPart ]
]
