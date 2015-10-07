package util

import java.util.Collection
import java.util.Collections
import jugador.Personaje
import jugador.Jugador
import java.util.List
import jugador.EstadisticaDePersonaje

/**
 * Este objeto es utilizado para armar un listado de Estadisticas de Personajes
 * para ser utilizados en ciertas AppModel.
 * 
 * @author Sandoval Lucas
 * @author Leutwyler Nicolas
 * @author Zaracho Nicolas
 */
class PrepararEstadisticasPersonajes {
	
	Collection<Personaje> personajesTotales
	Jugador jugadorActual
	
	new (Jugador elJugador , Collection<Personaje> personajesEntrantes) {
		this.personajesTotales = personajesEntrantes 
		this.jugadorActual = elJugador
	}
	
	/**
	 * De acuerdo a los personajesTotales presentes en el objeto, se arma un listado 
	 * de estadisticas las cuales incluyen a todas las del jugadorActual, sumado a las estadisticas
	 * (vacias) de los jugadores existentes en los personajesTotales los cuales aun no fueron
	 * utilizados por el jugadorActual
	 * 
	 * @return Listado de estadisticas por personaje, ordenados por nombre de personaje.
	 */
	def estadisticasPreparadas() {
		var List<EstadisticaDePersonaje> estadisticasARetornar = newArrayList
		for (Personaje personaje : personajesTotales) {
			var estadisticaBuscada = this.jugadorActual.estadisticaDelPersonaje(personaje)
			if (estadisticaBuscada != null) {
				estadisticasARetornar.add(estadisticaBuscada)
			} else {
			var estN = new EstadisticaDePersonaje(personaje)
				estadisticasARetornar.add(new EstadisticaDePersonaje(personaje))
				jugadorActual.est.add(estN)	
			}
		}
		Collections.sort(estadisticasARetornar)
		return estadisticasARetornar
	}
}
