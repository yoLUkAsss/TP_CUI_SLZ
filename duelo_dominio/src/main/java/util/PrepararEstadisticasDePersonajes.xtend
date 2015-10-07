package util

import java.util.Collection
import java.util.Collections
import jugador.Personaje
import jugador.Jugador
import java.util.List
import jugador.EstadisticaDePersonaje

class PrepararEstadisticasPersonajes {
	
	Collection<Personaje> personajesTotales
	Jugador jugadorActual
	
	new (Jugador elJugador , Collection<Personaje> personajesEntrantes) {
		this.personajesTotales = personajesEntrantes 
		this.jugadorActual = elJugador
	}
	
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
