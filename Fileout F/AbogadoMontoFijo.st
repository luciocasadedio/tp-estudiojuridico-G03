'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:25 am'!
!classDefinition: #AbogadoMontoFijo category: #EstudioJuridico!
Abogado subclass: #AbogadoMontoFijo
	instanceVariableNames: 'montoFijo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!AbogadoMontoFijo methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:53:45'!
cargaDatos
    super cargaDatos.
    montoFijo := (Prompter prompt:
        'Ingrese monto fijo por causa favorable') asNumber.! !


!AbogadoMontoFijo methodsFor: 'loading' stamp: ''!
cargaDatosConsola: unaConsola
	super cargaDatosConsola: unaConsola.
	montoFijo := (Prompter prompt:
		'Ingrese monto fijo por causa favorable') asNumber.! !


!AbogadoMontoFijo methodsFor: 'liquidacion' stamp: ''!
calcularLiquidacion: unaCausa
	unaCausa esFavorable
		ifTrue: [ ^ montoFijo ]
		ifFalse: [ ^ 0 ].! !
