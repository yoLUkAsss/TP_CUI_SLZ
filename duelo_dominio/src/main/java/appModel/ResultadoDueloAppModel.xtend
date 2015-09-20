package appModel


import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.EstadisticasPj

import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors

class ResultadoDueloAppModel {
	
	DetalleJugadorDueloAppModel rival
	DetalleJugadorDueloAppModel retador
	Jugador ganador
	Jugador perdedor
	Integer resultadoGanador
	Integer resultadoPerdedor
	EstadisticasPj pjRetador
	EstadisticasPj pjRival
	Boolean empate = false
	
	new (DetalleJugadorDueloAppModel retador,DetalleJugadorDueloAppModel rival){
		this.rival=rival
		this.retador=retador
	}
	
	def getDescription(){
		if(empate){
			return '''Empataste con: «rival.jugador.nombre»'''
		}	
		if(ganador.equals(retador.jugador)){
			return '''Le ganaste a: «rival.jugador.nombre»'''
		} 
		return '''Perdiste con: «rival.jugador.nombre»'''
	}
	
	
		
	def actualizarDatos () {
		var analyzer = analizador()
	
		var resultadoRival = analyzer.realizarDuelo(
				retador.jugador,rival.jugador,
				retador.pj,rival.pj,
				retador.posElegida,rival.posElegida
		)

		pjRetador = retador.jugador.est.findFirst[each | each.nombre.equals(retador.pj.nombre)]
		pjRival = rival.jugador.est.findFirst[each | each.nombre.equals(rival.pj.nombre)]

		System.out.println(pjRetador.calificacion)
		System.out.println(resultadoRival)
		System.out.println(retador.jugador.equals(rival.jugador))

		if (pjRetador.calificacion > resultadoRival) {
			ganador = retador.jugador
			perdedor = rival.jugador
			resultadoGanador = pjRetador.calificacion
			resultadoPerdedor = resultadoRival
		} else {
			if (pjRetador.calificacion < resultadoRival) {
				ganador = rival.jugador
				perdedor = retador.jugador
				resultadoPerdedor = pjRetador.calificacion
				resultadoGanador = resultadoRival
			}
			else 
				empate = true

		firePropertyChanged(this,"description",description);
		System.out.println(retador.jugador.equals(rival.jugador))
		}
	}
	
	 
	def analizador(){
		
		new AnalizadorDeAtaque()
	}
	
}
