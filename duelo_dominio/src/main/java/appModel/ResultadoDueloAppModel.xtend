package appModel


import jugador.Jugador
import jugador.EstadisticasPj

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
		
	def actualizarDatos () {
		var analyzer = new AnalizadorDeAtaque()
	
		var resultadoRival = analyzer.realizarDuelo(
				retador.jugador,rival.jugador,
				retador.pj,rival.pj,retador.posElegida,rival.posElegida
		)
		
		var estRetador = retador.jugador.est.findFirst[esta | esta.nombre.equals(retador.pj.nombre)]
		
		pjDelGanador = retador.jugador.est.findFirst[each | each.nombre.equals(retador.pj.nombre)]
		pjRival = rival.jugador.est.findFirst[each | each.nombre.equals(rival.pj.nombre)]
		
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
}