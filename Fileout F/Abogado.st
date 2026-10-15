'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:16 am'!
!classDefinition: #Abogado category: #EstudioJuridico!
Object subclass: #Abogado
	instanceVariableNames: 'id apellido nombre tipoDoc numDoc domicilio telefono email especialidad causasAbiertas'
	classVariableNames: 'UltimoId'
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!Abogado methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:13:03'!
calcularLiquidacion! !


!Abogado methodsFor: 'accessing' stamp: ''!
apellido
	^ apellido! !

!Abogado methodsFor: 'accessing' stamp: ''!
especialidad
	^ especialidad! !

!Abogado methodsFor: 'accessing' stamp: ''!
id
	^ id! !

!Abogado methodsFor: 'accessing' stamp: ''!
nombre
	^ nombre! !


!Abogado methodsFor: 'loading' stamp: ''!
cargaDatos
	^ self cargaDatosConsola: nil! !

!Abogado methodsFor: 'loading' stamp: ''!
cargaDatosConsola: unaConsola
	apellido := Prompter prompt: 'Ingrese apellido del abogado'.
	nombre := Prompter prompt: 'Ingrese nombre del abogado'.
	tipoDoc := Prompter prompt: 'Ingrese tipo de documento del abogado'.
	numDoc := Prompter prompt: 'Ingrese numero de documento del abogado'.
	domicilio := Prompter prompt: 'Ingrese domicilio del abogado'.
	telefono := Prompter prompt: 'Ingrese telefono del abogado'.

	email := Prompter prompt: 'Ingrese email del abogado'.
	[email includes: $@] whileFalse: [
		unaConsola isNil
			ifFalse: [
				unaConsola mostrarError:
					'El email debe contener el caracter @'.
			].
		email := Prompter prompt: 'Ingrese nuevamente el email del abogado'.
	].

	especialidad := Prompter prompt: 'Ingrese especialidad del abogado'.
	causasAbiertas := OrderedCollection new.
	id := Abogado generarSiguienteId.! !


!Abogado methodsFor: 'causas' stamp: ''!
asignarNuevaCausa: unaCausa
	causasAbiertas add: unaCausa.! !

!Abogado methodsFor: 'causas' stamp: ''!
cantidadCausasAbiertas
	^ causasAbiertas size! !

!Abogado methodsFor: 'causas' stamp: ''!
quitarCausa: unaCausa
	causasAbiertas
		remove: unaCausa
		ifAbsent: [].! !


!Abogado methodsFor: 'liquidacion' stamp: ''!
calcularLiquidacion: unaCausa
	^ 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Abogado class' category: #EstudioJuridico!
Abogado class
	instanceVariableNames: ''!

!Abogado class methodsFor: 'identificacion' stamp: ''!
generarId
	UltimoId := 0.! !

!Abogado class methodsFor: 'identificacion' stamp: ''!
generarSiguienteId
	UltimoId := UltimoId + 1.
	^ UltimoId! !
