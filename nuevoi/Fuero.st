'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:52 pm'!
!classDefinition: #Fuero category: #Kernel!
Object subclass: #Fuero
	instanceVariableNames: 'cod desc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel'!

!Fuero methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:10:25'!
cargaDatos
    cod := Prompter prompt: 'Ingrese codigo del fuero'.
    desc := Prompter prompt: 'Ingrese descripcion del fuero'.! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:15:28'!
cod
    ^ cod! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:44:53'!
desc
	^ desc! !
