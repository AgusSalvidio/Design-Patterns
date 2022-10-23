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

	parts add: aCarPart
]

{ #category : #'private - initialization' }
Car >> initialize [ 

	parts := OrderedCollection new
]

{ #category : #accessing }
Car >> parts [
	
	^ parts 
]
