'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:34 pm'!
!classDefinition: #AbogadoMontoFijo category: #Kernel!
Abogado subclass: #AbogadoMontoFijo
	instanceVariableNames: 'montoFijo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel'!

!AbogadoMontoFijo methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:57:15'!
calcularLiquidacion: unaCausa
    unaCausa esFavorable
        ifTrue: [
            ^ montoFijo
        ]
        ifFalse: [
            ^ 0
        ].! !

!AbogadoMontoFijo methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:53:45'!
cargaDatos
    super cargaDatos.
    montoFijo := (Prompter prompt:
        'Ingrese monto fijo por causa favorable') asNumber.! !
