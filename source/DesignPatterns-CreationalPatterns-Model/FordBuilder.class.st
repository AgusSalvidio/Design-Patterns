Class {
	#name : #FordBuilder,
	#superclass : #CarBuilder,
	#category : #'DesignPatterns-CreationalPatterns-Model-Builder'
}

{ #category : #adding }
FordBuilder >> add4CylinderEngine [

	self addToCar: Ford4CylinderEngine new
]

{ #category : #adding }
FordBuilder >> add4DoorSedanBody [

	self addToCar: Ford4DoorSedanBody new
]

{ #category : #adding }
FordBuilder >> addStandard6CylinderEngine [

	self addToCar: FordStandard6CylinderEngine new 
]

{ #category : #adding }
FordBuilder >> addTurbocharged6CylinderEngine [

	self addToCar: FordTurbocharged6CylinderEngine new
]

{ #category : #initialization }
FordBuilder >> initialize [ 

	car := FordCar new
]
