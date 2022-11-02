Class {
	#name : #BuilderTest,
	#superclass : #TestCase,
	#category : #'DesignPatterns-CreationalPatterns-Model-Tests-Tests'
}

{ #category : #tests }
BuilderTest >> testBuildFullAssembledCar [

	| builder assembledCar |
	builder := PorscheBuilder  new.

	builder
		add4DoorSedanBody;
		addStandard6CylinderEngine.

	assembledCar := builder assembledCar.

	self
		assert: builder class equals: PorscheBuilder;
		assert: assembledCar class equals: PorscheCar;
		assert: assembledCar hasBody;
		assert: (assembledCar parts at: 'Body') class
		equals: Porsche4DoorSedanBody;
		assert: assembledCar hasEngine;
		assert: (assembledCar parts at: 'Engine') class
		equals: PorscheStandard6CylinderEngine
]

{ #category : #tests }
BuilderTest >> testBuilderAccessors [

	| builder |
	
	builder := PorscheBuilder new.

	builder add4CylinderEngine.
	self
		assert: (builder car parts at: 'Engine') class
		equals: Porsche4CylinderEngine.

	builder addTurbocharged6CylinderEngine.

	self
		assert: (builder car parts at: 'Engine') class
		equals: PorscheTurbocharged6CylinderEngine.

	builder := ToyotaBuilder new.

	builder
		add4DoorSedanBody;
		addStandard6CylinderEngine.

	self
		assert: (builder car parts at: 'Body') class
		equals: Toyota4DoorSedanBody;
		assert: (builder car parts at: 'Engine') class
		equals: ToyotaStandard6CylinderEngine.

	builder addTurbocharged6CylinderEngine.
	self
		assert: (builder car parts at: 'Engine') class
		equals: ToyotaTurbocharged6CylinderEngine
]

{ #category : #tests }
BuilderTest >> testUpdatingCarPartsWhenBuilding [

	| builder |
	builder := FordBuilder new.

	builder
		add4DoorSedanBody;
		addTurbocharged6CylinderEngine.

	self
		assert: (builder car parts at: 'Body') class
		equals: Ford4DoorSedanBody;
		assert: (builder car parts at: 'Engine') class
		equals: FordTurbocharged6CylinderEngine.

	builder addStandard6CylinderEngine.
	self
		assert: (builder car parts at: 'Engine') class
		equals: FordStandard6CylinderEngine.

	builder add4CylinderEngine.
	self
		assert: (builder car parts at: 'Engine') class
		equals: Ford4CylinderEngine
]

{ #category : #tests }
BuilderTest >> testWhenBuildAnIncompleteCarShouldRaiseException [

	| builder |
	
	builder := ToyotaBuilder new.

	self
		should: [ builder assembledCar ]
		raise: AssertionFailed
		withMessageText: 'The car is not fully assembled.'.
		
	builder add4CylinderEngine.
	
	self
		should: [ builder assembledCar ]
		raise: AssertionFailed
		withMessageText: 'The car is not fully assembled.'.
]
