Class {
	#name : #BaselineOfDesignPatterns,
	#superclass : #BaselineOf,
	#category : #BaselineOfDesignPatterns
}

{ #category : #baselines }
BaselineOfDesignPatterns >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		self
			setUpDependenciesIn: spec;
			setUpPackagesIn: spec;
			setUpGroupsIn: spec
		]
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> baselineNameOf: aDependencyRepresentation [

	^ aDependencyRepresentation at: #baselineName
]

{ #category : #'private - dependencies accessing' }
BaselineOfDesignPatterns >> buoyDependency [

	^ self dependencyTo: 'Buoy' hostedIn: 'github://ba-st/Buoy:v6.2.0/source'
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> configure: aDependency asDependencyIn: aSpec [

	aSpec
		baseline: (self baselineNameOf: aDependency)
		with: [ aSpec repository: (self repositoryOf: aDependency) ]
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> configure: aPackage asPackageIn: aSpec [

	aSpec
		package: (self packageNameOf: aPackage)
		with: [ aSpec requires: (self requirementNamesOf: aPackage) ]
]

{ #category : #'private - model package accessing' }
BaselineOfDesignPatterns >> creationalPatternsModelPackage [

	^ self
		  packageNamed: 'DesignPatterns-CreationalPatterns-Model'
		  requiring: 'Buoy'
]

{ #category : #'private - test package accessing' }
BaselineOfDesignPatterns >> creationalPatternsTestPackage [

	^ self
		  packageNamed: 'DesignPatterns-CreationalPatterns-Model-Tests'
		  requiring: 'DesignPatterns-CreationalPatterns-Model'
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> dependencies [

	^ OrderedCollection new
		  add: self buoyDependency;
		  yourself
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> dependencyTo: aBaselineName hostedIn: aRepository [

	^ Dictionary new
		  at: #baselineName put: aBaselineName;
		  at: #repository put: aRepository;
		  yourself
]

{ #category : #'private - groups set up' }
BaselineOfDesignPatterns >> modelPackageNames [

	^ self packageNamesFrom: self modelPackages
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> modelPackages [

	^ OrderedCollection with: self creationalPatternsModelPackage
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> packageNameOf: aPackageRepresentation [

	^ aPackageRepresentation at: #packageName
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> packageNamed: aPackageName requiring: aRequirementNameCollection [

	^ Dictionary new
		  at: #packageName put: aPackageName;
		  at: #requirementNames put: aRequirementNameCollection;
		  yourself
]

{ #category : #'private - groups set up' }
BaselineOfDesignPatterns >> packageNamesFrom: aPackageRepresentationCollection [

	^ aPackageRepresentationCollection collect: [ :aPackageRepresentation | 
		  self packageNameOf: aPackageRepresentation ]
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> packages [

	^ OrderedCollection new
		  addAll: self modelPackages;
		  addAll: self testPackages;
		  yourself
]

{ #category : #baselines }
BaselineOfDesignPatterns >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> repositoryOf: aDependency [

	^ aDependency at: #repository
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> requirementNamesOf: aPackageRepresentation [

	^ aPackageRepresentation at: #requirementNames
]

{ #category : #'private - dependencies set up' }
BaselineOfDesignPatterns >> setUpDependenciesIn: spec [

	self dependencies do: [ :dependency | 
		self configure: dependency asDependencyIn: spec ]
]

{ #category : #'private - groups set up' }
BaselineOfDesignPatterns >> setUpGroupsIn: spec [

	spec
		group: 'Deployment' with: self modelPackageNames;
		group: 'Tests' with: self testPackageNames;
		group: 'CI' with: 'Tests';
		group: 'Tools' with: #(  );
		group: 'Dependent-SUnit-Extensions' with: #(  );
		group: 'Development' with: #( 'Tools' 'Tests' )
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> setUpPackagesIn: aSpec [

	self packages do: [ :package | 
		self configure: package asPackageIn: aSpec ]
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> testPackageNames [

	^ self packageNamesFrom: self testPackages
]

{ #category : #'private - packages set up' }
BaselineOfDesignPatterns >> testPackages [

	^ OrderedCollection with: self creationalPatternsTestPackage
]
