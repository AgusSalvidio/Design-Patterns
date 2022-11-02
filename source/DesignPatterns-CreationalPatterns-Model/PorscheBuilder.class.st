Class {
	#name : #PorscheBuilder,
	#superclass : #CarBuilder,
	#category : #'DesignPatterns-CreationalPatterns-Model-Builder'
}

{ #category : #adding }
PorscheBuilder >> add4CylinderEngine [

	self addToCar: Porsche4CylinderEngine new
]

{ #category : #adding }
PorscheBuilder >> add4DoorSedanBody [

	self addToCar: Porsche4DoorSedanBody new
]

{ #category : #adding }
PorscheBuilder >> addStandard6CylinderEngine [

	self addToCar: PorscheStandard6CylinderEngine new 
]

{ #category : #adding }
PorscheBuilder >> addTurbocharged6CylinderEngine [

	self addToCar: PorscheTurbocharged6CylinderEngine new
]

{ #category : #initialization }
PorscheBuilder >> initialize [ 

	car := PorscheCar new
]
