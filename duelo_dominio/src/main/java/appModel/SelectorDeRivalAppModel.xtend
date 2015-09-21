package appModel

import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import appModel.DetalleJugadorDueloAppModel
import java.util.Collections
import java.util.List

class SelectorDeRivalAppModel {
	
	
	List<Jugador> jugadores
	Collection<Personaje> personajes
	
	
	new(Collection<Personaje> pjs,List<Jugador> jgdrs){
		jugadores = jgdrs
		personajes= pjs
	}
	
	
	def dameRival(DetalleJugadorDueloAppModel retador) {
		val rival= jugadores.findFirst[jugador|puedeJugar(jugador.ranking(),retador.jugador.ranking())&& !jugador.equals(retador.jugador)
		]
		Collections.shuffle(jugadores);
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