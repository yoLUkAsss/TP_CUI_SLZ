package appModel


import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.EstadisticasPj

@Observable
@Accessors

class ResultadoDueloAppModel {
	
	DetalleJugadorDueloAppModel rival
	DetalleJugadorDueloAppModel retador
	Jugador ganador
	Jugador perdedor
	Integer resultadoGanador
	Integer resultadoPerdedor
	EstadisticasPj pjDelGanador
	EstadisticasPj pjRival
	
	new (DetalleJugadorDueloAppModel rival,DetalleJugadorDueloAppModel retador){
		this.rival=rival
		this.retador=retador
	}
	
	def getDescription(){
		if(retador.equals(perdedor)){
			return '''Perdiste contra «rival.jugador.nombre»'''
		}else{
			return '''Le ganaste a «rival.jugador.nombre»'''
		}
	}
	
	
		
	def actualizarDatos () {
		var analyzer = analizador()
	
		var resultadoRival = analyzer.realizarDuelo(
				retador.jugador,rival.jugador,
				retador.pj,rival.pj,retador.posElegida,rival.posElegida
		)
		
		var estRetador = retador.jugador.est.findFirst[esta | esta.nombre.equals(retador.pj.nombre)]

		pjDelGanador = retador.jugador.est.findFirst[each | each.nombre.equals(retador.pj.nombre)]
		pjRival = rival.jugador.est.findFirst[each | each.nombre.equals(rival.pj.nombre)]
		
		pjDelGanador = retador.jugador.est.findFirst[each | 
			each.nombre.equals(retador.pj.nombre)
		]
		pjRival = rival.jugador.est.findFirst[each | 
			each.nombre.equals(rival.pj.nombre)
		]
		if (estRetador.calificacion > resultadoRival) {
			ganador = retador.jugador
			perdedor = rival.jugador
			resultadoGanador = estRetador.calificacion
			resultadoPerdedor = resultadoRival
		} else {
			if (estRetador.calificacion < resultadoRival) {
				ganador = rival.jugador
				perdedor = retador.jugador
				resultadoPerdedor = estRetador.calificacion
				resultadoGanador = resultadoRival
			}
		}
	}
	
	def analizador(){
		
		new AnalizadorDeAtaque()
	}
	
}
