package util

import jugador.EstadisticaDePersonaje
import jugador.Personaje
import java.io.Serializable

class InformacionEstadistica implements Serializable{
	
	InformacionPersonaje personajeAsociado
	String duelosIniciados
	String duelosGanados
	String duelosGanadosNoIniciados
	String derrotasNoIniciadas
	String duelosEmpatados
	String mejorUbicacion
	String calificacion
	
	new (EstadisticaDePersonaje est) {
		this.personajeAsociado = new InformacionPersonaje(est.personajeAsociado)
		this.duelosIniciados = est.duelosIniciados.toString
		this.duelosGanados = est.duelosGanados.toString
		this.duelosGanadosNoIniciados = est.duelosGanadosNoIniciados.toString
		this.derrotasNoIniciadas = est.derrotasNoIniciadas.toString
		this.duelosEmpatados = est.duelosEmpatados.toString
		this.mejorUbicacion = est.mejorUbicacion.toString
		this.calificacion = est.calificacion.toString
	}
}