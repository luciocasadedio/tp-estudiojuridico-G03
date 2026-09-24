'From Cuis7.8 [latest update: #7977] on 24 September 2026 at 11:24:11 am'!
!classDefinition: #EstudioJuridico category: #Kernel!
Object subclass: #EstudioJuridico
	instanceVariableNames: 'abogados fueros causas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel'!

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 11:23:27'!
crearAbogado
Abogado cargaDatos.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:08:43'!
crearCausa
! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lucio 17/Sep/2026 10:08:49'!
crearFuero
! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 10:47:16'!
inicializar
abogados:= OrderedCollection new.
causas:= OrderedCollection new.
fueros:= OrderedCollection new.
Abogado GenerarId.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 11:17:40'!
listado
! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'lc 24/Sep/2026 10:35:19'!
menu
| op |
op := 5.
(op = 0 )whileFalse: [MessageBox notify: 'MENU:
1- Crear abogado
2- Crear causa
3 - Crear fuero
4 - Listado
0 - Salir'.

    op := (Prompter prompt: 'Ingrese opcion:') asNumber asInteger.
    
    (op = 1) ifTrue: [ self crearAbogado].
    (op = 2) ifTrue: [ self crearCausa ].
    (op = 3) ifTrue: [ self  crearFuero ].
    '(op = 4) ifTrue: [ self listado ].'
] .
! !
