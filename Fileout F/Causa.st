'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:48 am'!
!classDefinition: #Causa category: #EstudioJuridico!
Object subclass: #Causa
	instanceVariableNames: 'nroExp fechaInicio juzgado fuero demandante demandado detalle abogado fechaCierre sentenciaF monto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!Causa methodsFor: 'initialization' stamp: ''!
inicializarCausa
	nroExp := Prompter prompt: 'Ingrese numero de expediente'.
	fechaInicio := Date fromString:
		(Prompter prompt: 'Ingrese fecha de inicio dd/mm/aaaa').
	juzgado := Prompter prompt: 'Ingrese juzgado'.
	demandante := Prompter prompt: 'Ingrese demandante'.
	demandado := Prompter prompt: 'Ingrese demandado'.
	detalle := Prompter prompt: 'Ingrese detalle de la causa'.
	fechaCierre := nil.
	sentenciaF := nil.
	monto := nil.! !


!Causa methodsFor: 'state' stamp: ''!
esAbierta
	^ fechaCierre isNil! !

!Causa methodsFor: 'state' stamp: ''!
esFavorable
	^ sentenciaF = 'favorable'! !


!Causa methodsFor: 'closing' stamp: ''!
registrarCierre
	| opcion |

	self esAbierta
		ifFalse: [ ^ false ].

	fechaCierre := Date fromString:
		(Prompter prompt: 'Ingrese fecha de cierre dd/mm/aaaa').

	opcion := ChoicePrompter choices:
		#('Favorable' 'No favorable').

	opcion isNil
		ifTrue: [
			fechaCierre := nil.
			^ false
		].

	sentenciaF := opcion asLowercase.

	self esFavorable
		ifTrue: [
			monto := (Prompter prompt: 'Ingrese monto obtenido') asNumber.
		]
		ifFalse: [
			monto := 0.
		].

	^ true! !


!Causa methodsFor: 'accessing' stamp: ''!
abogado
	^ abogado! !

!Causa methodsFor: 'accessing' stamp: ''!
abogado: unAbogado
	abogado := unAbogado! !

!Causa methodsFor: 'accessing' stamp: ''!
fechaCierre
	^ fechaCierre! !

!Causa methodsFor: 'accessing' stamp: ''!
fechaInicio
	^ fechaInicio! !

!Causa methodsFor: 'accessing' stamp: ''!
fuero
	^ fuero! !

!Causa methodsFor: 'accessing' stamp: ''!
fuero: unFuero
	fuero := unFuero! !

!Causa methodsFor: 'accessing' stamp: ''!
monto
	^ monto! !

!Causa methodsFor: 'accessing' stamp: ''!
nroExp
	^ nroExp! !
