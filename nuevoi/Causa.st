'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:43 pm'!
!classDefinition: #Causa category: #Kernel!
Object subclass: #Causa
	instanceVariableNames: 'nroExp fechaInicio juzgado fuero demandante demandado detalle abogado fechaCierre sentenciaF monto'
	classVariableNames: 'UltimoId'
	poolDictionaries: ''
	category: 'Kernel'!

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:03:21'!
abogado
    ^ abogado! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:03:41'!
abogado: unAbogado
    abogado := unAbogado! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:12:22'!
esAbierta
 	^ fechaCierre isNil! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:55:45'!
esFavorable
    ^ sentenciaF = 'favorable'! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:06:46'!
fechaCierre
    ^ fechaCierre! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:06:36'!
fechaInicio
    ^ fechaInicio! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:06:55'!
fuero
    ^ fuero! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:21:10'!
fuero: unFuero
    fuero := unFuero! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:19:39'!
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

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:55:53'!
monto
    ^ monto! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:23:22'!
nroExp
	 ^ nroExp! !

!Causa methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 18:07:54'!
registrarCierre
    self esAbierta
        ifTrue: [
            fechaCierre := Date fromString:
                (Prompter prompt: 'Ingrese fecha de cierre dd/mm/aaaa').

            sentenciaF := (Prompter prompt:
                'Ingrese sentencia final (favorable/no favorable)') asLowercase.

            self esFavorable
                ifTrue: [
                    monto := (Prompter prompt: 'Ingrese monto obtenido') asNumber.
                ]
                ifFalse: [
                    monto := 0.
                ].
        ]
        ifFalse: [
            MessageBox notify: 'La causa ya se encuentra cerrada'.
        ].! !
