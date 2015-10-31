package util

import jugador.EstadisticaDePersonaje
import jugador.Posicion
import jugador.TipoCalificacion

class InformacionJugador {
	String Jugadas
	String Ganadas
	String Kills
	String Deaths
	String Assists
	Posicion MejorUbicacion
	TipoCalificacion Puntaje
	
	
	new (EstadisticaDePersonaje estadistica){
		this.Jugadas = estadistica.duelosIniciados.toString
		this.Ganadas = estadistica.duelosGanados.toString
		this.Kills = estadistica.duelosGanadosNoIniciados.toString
		this.Deaths = estadistica.derrotasNoIniciadas.toString
		this.Assists = estadistica.duelosEmpatados.toString
		this.MejorUbicacion = estadistica.mejorUbicacion
		this.Puntaje = estadistica.calificacion
	}
}