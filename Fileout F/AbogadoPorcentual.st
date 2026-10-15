'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:31 am'!
!classDefinition: #AbogadoPorcentual category: #EstudioJuridico!
Abogado subclass: #AbogadoPorcentual
	instanceVariableNames: 'porcentaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!AbogadoPorcentual methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:54:54'!
cargaDatos
    super cargaDatos.
    porcentaje := (Prompter prompt:
        'Ingrese porcentaje sobre el monto') asNumber.! !


!AbogadoPorcentual methodsFor: 'loading' stamp: ''!
cargaDatosConsola: unaConsola
	super cargaDatosConsola: unaConsola.
	porcentaje := (Prompter prompt:
		'Ingrese porcentaje sobre el monto obtenido') asNumber.! !


!AbogadoPorcentual methodsFor: 'liquidacion' stamp: ''!
calcularLiquidacion: unaCausa
	unaCausa esFavorable
		ifTrue: [
			^ unaCausa monto * porcentaje / 100
		]
		ifFalse: [
			^ 0
		].! !
