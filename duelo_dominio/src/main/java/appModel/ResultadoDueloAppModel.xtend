package appModel


import jugador.Jugador
class ResultadoDueloAppModel {
	
	DetalleJugadorDueloAppModel rival
	DetalleJugadorDueloAppModel retador
	Jugador ganador
	Jugador perdedor
	Integer resultadoGanador
	Integer resultadoPerdedor
	
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