Class {
	#name : #CarAssembler,
	#superclass : #Object,
	#category : #'DesignPatterns-CreationalPatterns-Model-AbstractFactory'
}

{ #category : #assembling }
CarAssembler >> assembleCarUsing: aCarPartFactory [

	| assembledCar |
	assembledCar := aCarPartFactory make: #car.
	assembledCar
		add: (aCarPartFactory make: #body);
		add: (aCarPartFactory make: #engine).

	^ assembledCar
]
