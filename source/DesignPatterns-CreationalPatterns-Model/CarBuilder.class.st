Class {
	#name : #CarBuilder,
	#superclass : #Object,
	#instVars : [
		'car'
	],
	#category : #'DesignPatterns-CreationalPatterns-Model-Builder'
}

{ #category : #'instance creation' }
CarBuilder class >> new [

	^ self basicNew initialize
]

{ #category : #adding }
CarBuilder >> add4CylinderEngine [

	self subclassResponsibility 
]

{ #category : #adding }
CarBuilder >> add4DoorSedanBody [

	self subclassResponsibility 
]

{ #category : #adding }
CarBuilder >> addStandard6CylinderEngine [

	self subclassResponsibility 
]

{ #category : #adding }
CarBuilder >> addToCar: aCarPart [

	(car hasAlreadyInstalled: aCarPart)
		ifTrue: [ car updateCarPartWith: aCarPart ]
		ifFalse: [ car add: aCarPart ]
]

{ #category : #adding }
CarBuilder >> addTurbocharged6CylinderEngine [

	self subclassResponsibility 
]

{ #category : #accessing }
CarBuilder >> assembledCar [

	| potentiallyAssembledCar |
	
	potentiallyAssembledCar := self car.
	
	self assertAllPartsAreAssembledFor: potentiallyAssembledCar. 
	
	^ potentiallyAssembledCar
]

{ #category : #'private - asserting' }
CarBuilder >> assertAllPartsAreAssembledFor: aCar [

	AssertionChecker
		enforce: [ aCar hasBody and: [ aCar hasEngine ] ]
		because: 'The car is not fully assembled.'
		raising: AssertionFailed
]

{ #category : #'private - accessing' }
CarBuilder >> car [ 

	^ car
]

{ #category : #initialization }
CarBuilder >> initialize [ 

	^ self subclassResponsibility 
]
