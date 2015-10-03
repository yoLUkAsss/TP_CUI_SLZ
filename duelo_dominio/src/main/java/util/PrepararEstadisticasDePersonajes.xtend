package util

import java.util.Collection
import java.util.Collections
import jugador.Personaje
import jugador.Jugador
import java.util.List
import jugador.EstadisticaDePersonaje
import appModel.EstadisticasArmadasAppModel

class PrepararEstadisticasPersonajes {
	
	Collection<Personaje> personajesTotales
	Jugador jugadorActual
	
	new (Jugador elJugador , Collection<Personaje> personajesEntrantes) {
		this.personajesTotales = personajesEntrantes 
		this.jugadorActual = elJugador
	}
	
	def estadisticasPreparadas() {
		var List<EstadisticasArmadasAppModel> estadisticasARetornar = newArrayList
		for (Personaje p : personajesTotales) {
			var estadisticaBuscada = this.jugadorActual.est.findFirst[each | each.esDeEstePersonaje(p)]
			if (estadisticaBuscada != null)
				estadisticasARetornar.add(new EstadisticasArmadasAppModel(p,estadisticaBuscada))
			else{
			var estN = new EstadisticaDePersonaje(p)
				estadisticasARetornar.add(new EstadisticasArmadasAppModel(p,estN))
				jugadorActual.est.add(estN)	
			}
		}
		Collections.sort(estadisticasARetornar)
		return estadisticasARetornar
	}
}