'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:42 am'!
!classDefinition: #Fuero category: #EstudioJuridico!
Object subclass: #Fuero
	instanceVariableNames: 'cod desc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!Fuero methodsFor: 'loading' stamp: ''!
cargaDatos
	cod := Prompter prompt: 'Ingrese codigo del fuero'.
	desc := Prompter prompt: 'Ingrese descripcion del fuero'.! !


!Fuero methodsFor: 'accessing' stamp: ''!
cod
	^ cod! !

!Fuero methodsFor: 'accessing' stamp: ''!
desc
	^ desc! !
