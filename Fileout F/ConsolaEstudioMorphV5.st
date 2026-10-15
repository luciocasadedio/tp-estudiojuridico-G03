'From Cuis7.6 [latest update: #7777] on 15 October 2026 at 11:42:04 am'!
!classDefinition: #ConsolaEstudioMorphV5 category: #EstudioJuridico!
BorderedBoxMorph subclass: #ConsolaEstudioMorphV5
	instanceVariableNames: 'modelo pantalla textoMorph barraTitulo panelInferior barraLateral'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EstudioJuridico'!

!ConsolaEstudioMorphV5 methodsFor: 'initialization' stamp: ''!
initialize
	super initialize.

	self color: (Color r: 0.03 g: 0.03 b: 0.04).
	self borderWidth: 3.
	self borderColor: (Color r: 0.12 g: 0.45 b: 0.18).
	self morphExtent: 1180@720.

	modelo := TextModel new.
	modelo actualContents: ''.

	self construirBarraTitulo.
	self construirPantalla.
	self construirBarraLateral.
	self construirPanelInferior.! !


!ConsolaEstudioMorphV5 methodsFor: 'opening' stamp: ''!
abrir
	self openInWorld.
	^ self! !


!ConsolaEstudioMorphV5 methodsFor: 'building' stamp: ''!
construirBarraLateral
	| indicadorSuperior indicadorInferior |

	barraLateral := BorderedBoxMorph new.
	barraLateral color: (Color r: 0.055 g: 0.065 b: 0.065).
	barraLateral borderWidth: 2.
	barraLateral borderColor: (Color r: 0.10 g: 0.60 b: 0.22).
	barraLateral morphPosition: 1065@105.
	barraLateral morphExtent: 75@500.

	indicadorSuperior := BorderedBoxMorph new.
	indicadorSuperior color: (Color r: 0.12 g: 0.95 b: 0.30).
	indicadorSuperior borderWidth: 1.
	indicadorSuperior borderColor: Color green.
	indicadorSuperior morphPosition: 22@25.
	indicadorSuperior morphExtent: 30@80.
	barraLateral addMorph: indicadorSuperior.

	indicadorInferior := BorderedBoxMorph new.
	indicadorInferior color: (Color r: 0.04 g: 0.30 b: 0.10).
	indicadorInferior borderWidth: 1.
	indicadorInferior borderColor: Color green.
	indicadorInferior morphPosition: 22@120.
	indicadorInferior morphExtent: 30@330.
	barraLateral addMorph: indicadorInferior.

	self addMorph: barraLateral.! !

!ConsolaEstudioMorphV5 methodsFor: 'building' stamp: ''!
construirBarraTitulo
	| titulo subtitulo botonRojo botonAmarillo botonVerde estado |

	barraTitulo := BorderedBoxMorph new.
	barraTitulo color: (Color r: 0.08 g: 0.09 b: 0.10).
	barraTitulo borderWidth: 2.
	barraTitulo borderColor: (Color r: 0.16 g: 0.65 b: 0.24).
	barraTitulo morphPosition: 20@20.
	barraTitulo morphExtent: 1120@70.

	botonRojo := BorderedBoxMorph new.
	botonRojo color: Color red.
	botonRojo borderWidth: 1.
	botonRojo borderColor: Color black.
	botonRojo morphPosition: 18@20.
	botonRojo morphExtent: 24@24.
	barraTitulo addMorph: botonRojo.

	botonAmarillo := BorderedBoxMorph new.
	botonAmarillo color: Color yellow.
	botonAmarillo borderWidth: 1.
	botonAmarillo borderColor: Color black.
	botonAmarillo morphPosition: 50@20.
	botonAmarillo morphExtent: 24@24.
	barraTitulo addMorph: botonAmarillo.

	botonVerde := BorderedBoxMorph new.
	botonVerde color: Color green.
	botonVerde borderWidth: 1.
	botonVerde borderColor: Color black.
	botonVerde morphPosition: 82@20.
	botonVerde morphExtent: 24@24.
	barraTitulo addMorph: botonVerde.

	titulo := LabelMorph new.
	titulo contents: 'ESTUDIO JURIDICO - CONSOLA'.
	titulo color: (Color r: 0.20 g: 1.00 b: 0.35).
	titulo morphPosition: 145@15.
	barraTitulo addMorph: titulo.

	subtitulo := LabelMorph new.
	subtitulo contents: 'GESTION DE CAUSAS Y LIQUIDACIONES'.
	subtitulo color: (Color r: 0.55 g: 0.78 b: 0.60).
	subtitulo morphPosition: 145@42.
	barraTitulo addMorph: subtitulo.

	estado := LabelMorph new.
	estado contents: 'SISTEMA ACTIVO'.
	estado color: (Color r: 0.20 g: 1.00 b: 0.35).
	estado morphPosition: 930@26.
	barraTitulo addMorph: estado.

	self addMorph: barraTitulo.! !

!ConsolaEstudioMorphV5 methodsFor: 'building' stamp: ''!
construirPanelInferior
	| marca estado luz barra1 barra2 barra3 barra4 barra5 |

	panelInferior := BorderedBoxMorph new.
	panelInferior color: (Color r: 0.075 g: 0.08 b: 0.085).
	panelInferior borderWidth: 2.
	panelInferior borderColor: (Color r: 0.14 g: 0.45 b: 0.20).
	panelInferior morphPosition: 20@620.
	panelInferior morphExtent: 1120@65.

	marca := LabelMorph new.
	marca contents: 'LEXAMP v1.0'.
	marca color: (Color r: 0.70 g: 0.75 b: 0.70).
	marca morphPosition: 25@23.
	panelInferior addMorph: marca.

	barra1 := BorderedBoxMorph new.
	barra1 color: Color green.
	barra1 morphPosition: 180@28.
	barra1 morphExtent: 12@15.
	panelInferior addMorph: barra1.

	barra2 := BorderedBoxMorph new.
	barra2 color: Color green.
	barra2 morphPosition: 198@24.
	barra2 morphExtent: 12@19.
	panelInferior addMorph: barra2.

	barra3 := BorderedBoxMorph new.
	barra3 color: Color green.
	barra3 morphPosition: 216@18.
	barra3 morphExtent: 12@25.
	panelInferior addMorph: barra3.

	barra4 := BorderedBoxMorph new.
	barra4 color: Color green.
	barra4 morphPosition: 234@23.
	barra4 morphExtent: 12@20.
	panelInferior addMorph: barra4.

	barra5 := BorderedBoxMorph new.
	barra5 color: Color green.
	barra5 morphPosition: 252@28.
	barra5 morphExtent: 12@15.
	panelInferior addMorph: barra5.

	luz := BorderedBoxMorph new.
	luz color: (Color r: 0.10 g: 1.00 b: 0.25).
	luz borderWidth: 2.
	luz borderColor: (Color r: 0.20 g: 0.55 b: 0.25).
	luz morphPosition: 855@20.
	luz morphExtent: 24@24.
	panelInferior addMorph: luz.

	estado := LabelMorph new.
	estado contents: 'ESTADO: ACTIVO'.
	estado color: (Color r: 0.20 g: 1.00 b: 0.35).
	estado morphPosition: 900@23.
	panelInferior addMorph: estado.

	self addMorph: panelInferior.! !

!ConsolaEstudioMorphV5 methodsFor: 'building' stamp: ''!
construirPantalla
	pantalla := BorderedBoxMorph new.
	pantalla color: (Color r: 0.01 g: 0.08 b: 0.025).
	pantalla borderWidth: 3.
	pantalla borderColor: (Color r: 0.10 g: 0.72 b: 0.23).
	pantalla morphPosition: 20@105.
	pantalla morphExtent: 1030@500.

	textoMorph := TextModelMorph
		textProvider: modelo
		textGetter: #actualContents
		textSetter: #actualContents:.

	textoMorph morphPosition: 18@18.
	textoMorph morphExtent: 990@460.
	textoMorph borderWidth: 0.

	pantalla addMorph: textoMorph.
	self addMorph: pantalla.! !


!ConsolaEstudioMorphV5 methodsFor: 'output' stamp: ''!
limpiar
	modelo actualContents: ''.! !

!ConsolaEstudioMorphV5 methodsFor: 'output' stamp: ''!
mostrar: unTexto
	modelo actualContents:
		modelo actualContents,
		'> ',
		unTexto,
		(String with: Character cr).! !

!ConsolaEstudioMorphV5 methodsFor: 'output' stamp: ''!
mostrarError: unTexto
	self mostrar: 'ERROR: ', unTexto.! !

!ConsolaEstudioMorphV5 methodsFor: 'output' stamp: ''!
mostrarTitulo: unTexto
	modelo actualContents:
		modelo actualContents,
		(String with: Character cr),
		'========================================',
		(String with: Character cr),
		unTexto,
		(String with: Character cr),
		'========================================',
		(String with: Character cr).! !


!ConsolaEstudioMorphV5 methodsFor: 'accessing' stamp: ''!
modelo
	^ modelo! !


!ConsolaEstudioMorphV5 methodsFor: 'as yet unclassified' stamp: 'SHOT 15/Oct/2026 11:28:09'!
cerrar
    self delete.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConsolaEstudioMorphV5 class' category: #EstudioJuridico!
ConsolaEstudioMorphV5 class
	instanceVariableNames: ''!

!ConsolaEstudioMorphV5 class methodsFor: 'instance creation' stamp: ''!
open
	^ self new abrir! !
