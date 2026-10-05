'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:39 pm'!
!classDefinition: #AbogadoPorcentual category: #Kernel!
Abogado subclass: #AbogadoPorcentual
	instanceVariableNames: 'porcentaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel'!

!AbogadoPorcentual methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:57:56'!
calcularLiquidacion: unaCausa
    unaCausa esFavorable
        ifTrue: [
            ^ unaCausa monto * porcentaje / 100
        ]
        ifFalse: [
            ^ 0
        ].! !

!AbogadoPorcentual methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:54:54'!
cargaDatos
    super cargaDatos.
    porcentaje := (Prompter prompt:
        'Ingrese porcentaje sobre el monto') asNumber.! !
