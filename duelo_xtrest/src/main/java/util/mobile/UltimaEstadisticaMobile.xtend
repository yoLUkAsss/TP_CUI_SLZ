package util.mobile

import jugador.EstadisticaDePersonaje
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UltimaEstadisticaMobile {
	
	
	/**
	 * Representa la informacion unica y necesaria a ser mostrada en dispositivos mobiles
	 * 
	 * @author Sandi
	 */
	String Jugadas
	String Ganadas
	String Kills
	String Deaths
	String Assists
	String MejorUbicacion
	String Puntaje

	
	new (EstadisticaDePersonaje unaEstadistica) {
		this.Jugadas = unaEstadistica.duelosIniciados.toString
		this.Ganadas = unaEstadistica.duelosGanados.toString
		this.Kills = unaEstadistica.duelosGanadosNoIniciados.toString
		this.Deaths = unaEstadistica.derrotasNoIniciadas.toString
		this.Assists = unaEstadistica.duelosEmpatados.toString
		this.MejorUbicacion = unaEstadistica.mejorUbicacion.toString
		this.Puntaje = unaEstadistica.calificacion.toString
	}
	
}