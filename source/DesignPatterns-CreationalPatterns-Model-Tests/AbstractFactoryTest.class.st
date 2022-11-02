Class {
	#name : #AbstractFactoryTest,
	#superclass : #TestCase,
	#category : #'DesignPatterns-CreationalPatterns-Model-Tests-Tests'
}

{ #category : #tests }
AbstractFactoryTest >> testAddingPartToCar [

	| car engine |
	car := FordCar new.

	self
		assert: car class equals: FordCar;
		assert: car parts isEmpty.

	engine := FordEngine new.
	car add: engine.

	self
		assert: car parts includes: engine
]

{ #category : #tests }
AbstractFactoryTest >> testAssembleCar [

	| factory carAssembler assembledCar |
	factory := FordFactory new.
	carAssembler := CarAssembler new.

	assembledCar := carAssembler assembleCarUsing: factory.

	self
		assert: carAssembler class equals: CarAssembler;
		assert: assembledCar class equals: FordCar;
		assert: assembledCar parts size equals: 2;
		assert: assembledCar hasBody;
		assert: assembledCar hasEngine
]

{ #category : #tests }
AbstractFactoryTest >> testCreateACar [

	|car|
	
	car := FordCar new.
	
	self 
		assert: car class equals: FordCar;
		assert: car parts isEmpty.
]

{ #category : #tests }
AbstractFactoryTest >> testCreateCarPartFactory [

	| fordFactory porscheFactory toyotaFactory |
	fordFactory := FordFactory new.
	porscheFactory := PorscheFactory new.
	toyotaFactory := ToyotaFactory new.

	self
		assert: fordFactory class equals: FordFactory;
		assert: porscheFactory class equals: PorscheFactory;
		assert: toyotaFactory class equals: ToyotaFactory
]

{ #category : #tests }
AbstractFactoryTest >> testMakingCarParts [

	|factory car body engine|
	
	factory := FordFactory new.
	
	car := factory make: #car.
	body := factory make: #body.
	engine := factory make: #engine.
	
	
	self
		assert: car class equals: FordCar;
		assert: body class equals: FordBody;
		assert: engine class equals: FordEngine
	
]

{ #category : #tests }
AbstractFactoryTest >> testUpdateCarPart [

	| factory carAssembler assembledCar updatedCarPart |
	
	factory := FordFactory new.
	carAssembler := CarAssembler new.

	assembledCar := carAssembler assembleCarUsing: factory.

	updatedCarPart := FordTurbocharged6CylinderEngine new.
	assembledCar updateCarPartWith: updatedCarPart.

	self assert: assembledCar parts includes: updatedCarPart
]

{ #category : #tests }
AbstractFactoryTest >> testWhenMakingCarPartNotInCatalogShouldRaiseException [

	|factory|
	
	factory := FordFactory new.
	
	self
		should: [factory make: #house]
		raise: ObjectNotFound 
		withMessageText: 'There''s no object bound to house'
	
]
