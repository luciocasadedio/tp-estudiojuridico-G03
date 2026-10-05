'From Cuis7.6 [latest update: #7777] on 5 October 2026 at 6:22:47 pm'!
!classDefinition: #EstudioJuridico category: #Kernel!
Object subclass: #EstudioJuridico
	instanceVariableNames: 'abogados fueros causas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel'!

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:05:28'!
cerrarCausa
    | numeroExp unaCausa |

    numeroExp := Prompter prompt: 'Ingrese numero de expediente'.

    unaCausa := causas
        detect: [:cadaCausa | cadaCausa nroExp = numeroExp]
        ifNone: [nil].

    unaCausa isNil
        ifTrue: [
            MessageBox notify:
                'No existe una causa con ese numero de expediente'.
        ]
        ifFalse: [
            unaCausa esAbierta
                ifTrue: [
                    unaCausa registrarCierre.
                    unaCausa abogado quitarCausa: unaCausa.
                ]
                ifFalse: [
                    MessageBox notify:
                        'La causa ya se encuentra cerrada'.
                ].
        ].! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:59:34'!
crearAbogado
    | tipo unAbogado |

    tipo := ChoicePrompter choices:
        #('Monto fijo' 'Porcentual').

    (tipo = 'Monto fijo')
        ifTrue: [
            unAbogado := AbogadoMontoFijo new.
        ].

    (tipo = 'Porcentual')
        ifTrue: [
            unAbogado := AbogadoPorcentual new.
        ].

    unAbogado cargaDatos.
    abogados add: unAbogado.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:44:11'!
crearCausa
    | unaCausa codigoFuero unFuero unAbogado |

    unaCausa := Causa new.
    unaCausa inicializarCausa.

    unFuero := nil.

    [ unFuero isNil ] whileTrue: [
        codigoFuero := Prompter prompt: 'Ingrese codigo del fuero'.

        unFuero := fueros
            detect: [:cadaFuero | cadaFuero cod = codigoFuero]
            ifNone: [nil].
    ].

    unaCausa fuero: unFuero.

    unAbogado := self obtenerMenosOcupadoPara: unFuero.

    unAbogado isNil
        ifTrue: [
            MessageBox notify:
                'No existe un abogado con la especialidad correspondiente'.
            ^ self
        ].

   	unaCausa abogado: unAbogado.
	unAbogado asignarNuevaCausa: unaCausa.
	causas add: unaCausa.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:11:45'!
crearFuero
    | unFuero |

    unFuero := Fuero new.
    unFuero cargaDatos.
    fueros add: unFuero.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 15:03:43'!
inicializar
    abogados := OrderedCollection new.
    fueros := OrderedCollection new.
    causas := OrderedCollection new.
    Abogado generarId.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 18:08:10'!
listado
    | fechaDesde fechaHasta liquidacion |

    fechaDesde := Date fromString:
        (Prompter prompt: 'Ingrese fecha desde dd/mm/aaaa').

    fechaHasta := Date fromString:
        (Prompter prompt: 'Ingrese fecha hasta dd/mm/aaaa').

    Transcript clear.
    Transcript show: 'LISTADO DE LIQUIDACIONES'.
    Transcript cr.
    Transcript cr.

    causas do: [:cadaCausa |

        cadaCausa esAbierta
            ifFalse: [

                cadaCausa esFavorable
                    ifTrue: [

                        (((cadaCausa fechaCierre
                            subtractDate: fechaDesde) >= 0)
                            and: [
                                (fechaHasta
                                    subtractDate: cadaCausa fechaCierre) >= 0
                            ])
                            ifTrue: [

                                liquidacion :=
                                    cadaCausa abogado
                                        calcularLiquidacion: cadaCausa.

                                Transcript
                                    show: 'Numero de expediente: ';
                                    show: cadaCausa nroExp;
                                    cr;

                                    show: 'Fecha de inicio: ';
                                    show: cadaCausa fechaInicio printString;
                                    cr;

                                    show: 'Fecha de cierre: ';
                                    show: cadaCausa fechaCierre printString;
                                    cr;

                                    show: 'Fuero: ';
                                    show: cadaCausa fuero desc;
                                    cr;

                                    show: 'Abogado: ';
                                    show: cadaCausa abogado nombre;
                                    space;
                                    show: cadaCausa abogado apellido;
                                    cr;

                                    show: 'Monto obtenido: ';
                                    show: cadaCausa monto printString;
                                    cr;

                                    show: 'Monto a liquidar al abogado: ';
                                    show: liquidacion printString;
                                    cr;
                                    cr.
                            ].
                    ].
            ].
    ].

    MessageBox notify: 'Listado generado en Transcript'.! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 17:15:28'!
menu
    | op entrada |

    op := -1.

    [ op = 0 ] whileFalse: [

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
            ifTrue: [
                ^ self
            ].

        entrada isEmpty
            ifTrue: [
                ^ self
            ].

        op := entrada asNumber asInteger.

        (op = 1) ifTrue: [ self crearAbogado ].
        (op = 2) ifTrue: [ self crearCausa ].
        (op = 3) ifTrue: [ self crearFuero ].
        (op = 4) ifTrue: [ self cerrarCausa ].
        (op = 5) ifTrue: [ self listado ].
    ].! !

!EstudioJuridico methodsFor: 'as yet unclassified' stamp: 'SHOT 5/Oct/2026 16:46:56'!
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
