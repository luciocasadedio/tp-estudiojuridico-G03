'From Cuis7.8 [latest update: #7977] on 24 September 2026 at 11:23:59 am'!
!classDefinition: #Abogado category: #Kernel!
Object subclass: #Abogado
	instanceVariableNames: 'id apellido nombre tipoDoc numDoc domicilio telefono email especialidad causasAbiertas'
	classVariableNames: 'UltimoId'
	poolDictionaries: ''
	category: 'Kernel'!

!Abogado methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:13:16'!
asignarNuevaCausa! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:13:03'!
calcularLiquidacion! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 11:22:45'!
cargaDatos
apellido:= Prompter prompt: 'Ingrese apellido del abogado'.
nombre:= Prompter prompt: 'Ingrese nombre del abogado'.
tipoDoc:= Prompter prompt: 'Ingrese documento del abogado'.
numDoc:= Prompter prompt: 'Ingrese numero de documento del abogado'.
domicilio:= Prompter prompt: 'Ingrese domicilio del abogado'.
telefono:= Prompter prompt: 'Ingrese telefono del abogado'.
email:= Prompter prompt: 'Ingrese email del abogado'.
especialidad:= Prompter prompt: 'Ingrese especialidad del abogado'.
id:= Abogado GenerarSiguienteId.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Abogado class' category: #Kernel!
Abogado class
	instanceVariableNames: ''!

!Abogado class methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 10:44:31'!
GenerarId
UltimoId=0.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 11:08:02'!
GenerarSiguienteId
UltimoId := UltimoId + 1.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 11:08:18'!
ObtenerMenosOcupado! !
