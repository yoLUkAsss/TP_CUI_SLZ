package util

import jugador.EstadisticaDePersonaje
import jugador.Posicion
import jugador.TipoCalificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class InformacionJugador {
	String Jugadas
	String Ganadas
	String Kills
	String Deaths
	String Assists
	String MejorUbicacion
	String Puntaje
	
	
	new (EstadisticaDePersonaje estadistica){
		this.Jugadas = estadistica.duelosIniciados.toString
		this.Ganadas = estadistica.duelosGanados.toString
		this.Kills = estadistica.duelosGanadosNoIniciados.toString
		this.Deaths = estadistica.derrotasNoIniciadas.toString
		this.Assists = estadistica.duelosEmpatados.toString
		this.MejorUbicacion = estadistica.mejorUbicacion.toString
		this.Puntaje = estadistica.calificacion.toString
	}
}