package util

import jugador.EstadisticaDePersonaje
import jugador.Posicion
import jugador.TipoCalificacion

class InformacionJugador {
	Integer Jugadas
	Integer Ganadas
	Integer Kills
	Integer Deaths
	Integer Assists
	Posicion MejorUbicacion
	TipoCalificacion Puntaje
	
	
	new (EstadisticaDePersonaje estadistica){
		this.Jugadas = estadistica.duelosIniciados
		this.Ganadas = estadistica.duelosGanados
		this.Kills = estadistica.duelosGanadosNoIniciados
		this.Deaths = estadistica.derrotasNoIniciadas
		this.Assists = estadistica.duelosEmpatados
		this.MejorUbicacion = estadistica.mejorUbicacion
		this.Puntaje = estadistica.calificacion
	}
}