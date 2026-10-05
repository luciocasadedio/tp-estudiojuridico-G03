'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:16 pm'!
!classDefinition: #Abogado category: #Kernel!
Object subclass: #Abogado
	instanceVariableNames: 'id apellido nombre tipoDoc numDoc domicilio telefono email especialidad causasAbiertas'
	classVariableNames: 'UltimoId'
	poolDictionaries: ''
	category: 'Kernel'!

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:07:18'!
apellido
    ^ apellido! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:42:32'!
asignarNuevaCausa: unaCausa
    causasAbiertas add: unaCausa.! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:13:03'!
calcularLiquidacion! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:33:26'!
cantidadCausasAbiertas
 	^ causasAbiertas size! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 18:12:06'!
cargaDatos
	apellido := Prompter prompt: 'Ingrese apellido del abogado'.
	nombre := Prompter prompt: 'Ingrese nombre del abogado'.
	tipoDoc := Prompter prompt: 'Ingrese tipo de documento del abogado'.
	numDoc := Prompter prompt: 'Ingrese numero de documento del abogado'.
	domicilio := Prompter prompt: 'Ingrese domicilio del abogado'.
	telefono := Prompter prompt: 'Ingrese telefono del abogado'.
	email := Prompter prompt: 'Ingrese email del abogado'.
	especialidad := Prompter prompt: 'Ingrese especialidad del abogado'.
	causasAbiertas := OrderedCollection new.
	id := Abogado generarSiguienteId.! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:44:24'!
especialidad
	^ especialidad! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:17:28'!
id
    ^ id! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:36:09'!
nombre 
		^ nombre! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:22:01'!
quitarCausa: unaCausa 
	causasAbiertas
		remove: unaCausa
		ifAbsent: [].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Abogado class' category: #Kernel!
Abogado class
	instanceVariableNames: ''!

!Abogado class methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 18:11:10'!
generarId
    UltimoId := 0.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 18:11:19'!
generarSiguienteId
    UltimoId := UltimoId + 1.
    ^ UltimoId! !
