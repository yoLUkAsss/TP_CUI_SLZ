package appModel

import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import appModel.DetalleJugadorDueloAppModel

class SelectorDeRivalAppModel {
	
	
	Collection<Jugador> jugadores
	Collection<Personaje> personajes
	
	
	new(Collection<Personaje> pjs){
		jugadores= newArrayList
		jugadores.add(new Jugador("Marquitos"))
		personajes= pjs
	}
	
	
	def dameRival(DetalleJugadorDueloAppModel retador) {
		val rival= jugadores.findFirst[jugador|puedeJugar(jugador.ranking(),retador.jugador.ranking())&& !jugador.equals(retador.jugador)
		]
		if (rival!=null)
			 return new DetalleJugadorDueloAppModel(rival,determinarPersonaje(retador.pj),determinarPersonaje(retador.pj).posIdeal)
		return null
	}
	
	def puedeJugar(int rankingRival, int rankingJugador) {
		rankingRival >= rankingJugador-100 && rankingRival<= rankingJugador +100
	}
	
	def determinarPersonaje(Personaje personajeRetador){
		val personaje= personajes.findFirst[personaje|!personaje.equals(personajeRetador)]
		personaje
	}
	
	def agregarJugador(Jugador jugador){
		
		jugadores.add(jugador)
	}
	
	def agregarPersonaje(Personaje personaje) {
		
		personajes.add(personaje)
		
	}
}
