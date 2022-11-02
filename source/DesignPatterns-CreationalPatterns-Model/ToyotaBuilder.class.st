Class {
	#name : #ToyotaBuilder,
	#superclass : #CarBuilder,
	#category : #'DesignPatterns-CreationalPatterns-Model-Builder'
}

{ #category : #adding }
ToyotaBuilder >> add4CylinderEngine [

	self addToCar: Toyota4CylinderEngine new
]

{ #category : #adding }
ToyotaBuilder >> add4DoorSedanBody [

	self addToCar: Toyota4DoorSedanBody new
]

{ #category : #adding }
ToyotaBuilder >> addStandard6CylinderEngine [

	self addToCar: ToyotaStandard6CylinderEngine new 
]

{ #category : #adding }
ToyotaBuilder >> addTurbocharged6CylinderEngine [

	self addToCar: ToyotaTurbocharged6CylinderEngine new
]

{ #category : #initialization }
ToyotaBuilder >> initialize [ 

	car := ToyotaCar new
]
