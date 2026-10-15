'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 3:42:14 pm'!
!classDefinition: #EstudioJuridico category: #EstudioJuridico!
Object subclass: #EstudioJuridico
	instanceVariableNames: 'abogados fueros causas consola'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!EstudioJuridico methodsFor: 'initialization' stamp: ''!
inicializar
	abogados := OrderedCollection new.
	fueros := OrderedCollection new.
	causas := OrderedCollection new.
	Abogado generarId.

	consola := ConsolaEstudioMorphV5 open.
	consola mostrarTitulo: 'ESTUDIO JURIDICO'.
	consola mostrar: 'Sistema iniciado correctamente'.! !

!EstudioJuridico methodsFor: 'initialization' stamp: ''!
iniciar
	self inicializar.
	self menu.! !


!EstudioJuridico methodsFor: 'creation' stamp: ''!
crearAbogado
	| tipo unAbogado |

	tipo := ChoicePrompter choices:
		#('Monto fijo' 'Porcentual').

	tipo isNil
		ifTrue: [
			consola mostrar: 'Alta de abogado cancelada'.
			^ self
		].

	(tipo = 'Monto fijo')
		ifTrue: [
			unAbogado := AbogadoMontoFijo new.
		].

	(tipo = 'Porcentual')
		ifTrue: [
			unAbogado := AbogadoPorcentual new.
		].

	unAbogado cargaDatosConsola: consola.
	abogados add: unAbogado.

	consola mostrar:
		'Abogado registrado: ',
		unAbogado nombre,
		' ',
		unAbogado apellido.! !

!EstudioJuridico methodsFor: 'creation' stamp: ''!
crearCausa
	| unaCausa codigoFuero unFuero unAbogado |

	fueros isEmpty
		ifTrue: [
			consola mostrarError:
				'No hay fueros cargados en el sistema'.
			^ self
		].

	unaCausa := Causa new.
	unaCausa inicializarCausa.

	unFuero := nil.

	[unFuero isNil] whileTrue: [
		codigoFuero := Prompter prompt:
			'Ingrese codigo del fuero'.

		codigoFuero isNil
			ifTrue: [
				consola mostrar: 'Alta de causa cancelada'.
				^ self
			].

		codigoFuero isEmpty
			ifTrue: [
				consola mostrar: 'Alta de causa cancelada'.
				^ self
			].

		unFuero := fueros
			detect: [:cadaFuero |
				cadaFuero cod = codigoFuero
			]
			ifNone: [nil].

		unFuero isNil
			ifTrue: [
				consola mostrarError:
					'El fuero ingresado no existe'.
			].
	].

	unaCausa fuero: unFuero.

	unAbogado := self obtenerMenosOcupadoPara: unFuero.

	unAbogado isNil
		ifTrue: [
			consola mostrarError:
				'No existe un abogado con la especialidad correspondiente'.
			^ self
		].

	unaCausa abogado: unAbogado.
	unAbogado asignarNuevaCausa: unaCausa.
	causas add: unaCausa.

	consola mostrar:
		'Causa registrada. Expediente: ',
		unaCausa nroExp.
	consola mostrar:
		'Abogado asignado: ',
		unAbogado nombre,
		' ',
		unAbogado apellido.! !

!EstudioJuridico methodsFor: 'creation' stamp: ''!
crearFuero
	| unFuero |

	unFuero := Fuero new.
	unFuero cargaDatos.
	fueros add: unFuero.

	consola mostrar:
		'Fuero registrado: ',
		unFuero cod,
		' - ',
		unFuero desc.! !


!EstudioJuridico methodsFor: 'assignment' stamp: ''!
obtenerMenosOcupadoPara: unFuero
	| compatibles menosOcupado |

	compatibles := abogados select: [:cadaAbogado |
		cadaAbogado especialidad = unFuero desc
	].

	compatibles isEmpty
		ifTrue: [ ^ nil ].

	menosOcupado := compatibles first.

	compatibles do: [:cadaAbogado |
		(cadaAbogado cantidadCausasAbiertas <
			menosOcupado cantidadCausasAbiertas)
				ifTrue: [
					menosOcupado := cadaAbogado.
				].
	].

	^ menosOcupado! !


!EstudioJuridico methodsFor: 'closing' stamp: ''!
cerrarCausa
	| numeroExp unaCausa cierreRealizado |

	numeroExp := Prompter prompt:
		'Ingrese numero de expediente'.

	unaCausa := causas
		detect: [:cadaCausa |
			cadaCausa nroExp = numeroExp
		]
		ifNone: [nil].

	unaCausa isNil
		ifTrue: [
			consola mostrarError:
				'No existe una causa con ese numero de expediente'.
			^ self
		].

	unaCausa esAbierta
		ifFalse: [
			consola mostrarError:
				'La causa ya se encuentra cerrada'.
			^ self
		].

	cierreRealizado := unaCausa registrarCierre.

	cierreRealizado
		ifFalse: [
			consola mostrar:
				'Cierre de causa cancelado'.
			^ self
		].

	unaCausa abogado quitarCausa: unaCausa.

	consola mostrar:
		'Causa cerrada correctamente. Expediente: ',
		unaCausa nroExp.! !


!EstudioJuridico methodsFor: 'reports' stamp: ''!
listado
	| fechaDesde fechaHasta liquidacion causasCerradas cantidad |

	causasCerradas := causas select: [:cadaCausa |
		cadaCausa esAbierta not
	].

	causasCerradas isEmpty
		ifTrue: [
			consola mostrarError:
				'No hay causas cerradas para listar'.
			^ self
		].

	fechaDesde := Date fromString:
		(Prompter prompt: 'Ingrese fecha desde dd/mm/aaaa').

	fechaHasta := Date fromString:
		(Prompter prompt: 'Ingrese fecha hasta dd/mm/aaaa').

	consola limpiar.
	consola mostrarTitulo: 'LISTADO DE LIQUIDACIONES'.

	cantidad := 0.

	causasCerradas do: [:cadaCausa |
		cadaCausa esFavorable
			ifTrue: [
				(((cadaCausa fechaCierre subtractDate: fechaDesde) >= 0)
					and: [
						(fechaHasta subtractDate:
							cadaCausa fechaCierre) >= 0
					])
					ifTrue: [
						liquidacion :=
							cadaCausa abogado
								calcularLiquidacion: cadaCausa.

						consola mostrar:
							'Numero de expediente: ',
							cadaCausa nroExp.
						consola mostrar:
							'Fecha de inicio: ',
							cadaCausa fechaInicio printString.
						consola mostrar:
							'Fecha de cierre: ',
							cadaCausa fechaCierre printString.
						consola mostrar:
							'Fuero: ',
							cadaCausa fuero desc.
						consola mostrar:
							'Abogado: ',
							cadaCausa abogado nombre,
							' ',
							cadaCausa abogado apellido.
						consola mostrar:
							'Monto obtenido: ',
							cadaCausa monto printString.
						consola mostrar:
							'Monto a liquidar: ',
							liquidacion printString.
						consola mostrar: ''.

						cantidad := cantidad + 1.
					].
			].
	].

	cantidad = 0
		ifTrue: [
			consola mostrar:
				'No hay liquidaciones favorables en el periodo indicado'.
		].! !


!EstudioJuridico methodsFor: 'menu' stamp: 'SHOT 15/Oct/2026 15:41:48'!
menu
    | op entrada |

    op := -1.

    [op = 0] whileFalse: [

        entrada := Prompter prompt:
            'MENU

1 - Crear abogado
2 - Crear causa
3 - Crear fuero
4 - Cerrar causa
5 - Listado de liquidaciones
0 - Salir

Ingrese opcion:'.

        entrada isNil
            ifTrue: [ ^ self ].

        entrada isEmpty
            ifTrue: [ ^ self ].

        (#('0' '1' '2' '3' '4' '5') includes: entrada)
            ifTrue: [

                op := entrada asNumber asInteger.

                (op = 1) ifTrue: [ self crearAbogado ].
                (op = 2) ifTrue: [ self crearCausa ].
                (op = 3) ifTrue: [ self crearFuero ].
                (op = 4) ifTrue: [ self cerrarCausa ].
                (op = 5) ifTrue: [ self listado ].

            ]
            ifFalse: [
                consola mostrarError:
                    'Opcion invalida. Ingrese un numero entre 0 y 5'.
            ].
    ].

    consola mostrar: 'Sistema finalizado'.! !


!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 15/Oct/2026 11:30:14'!
cerrarConsola
    consola cerrar.! !
