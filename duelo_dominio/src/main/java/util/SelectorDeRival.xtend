package util

import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import util.DetalleJugadorDuelo
import java.util.Collections
import java.util.List

class SelectorDeRival {
	
	
	List<Jugador> jugadores
	List<Personaje> personajes
	
	
	new(List<Personaje> pjs,List<Jugador> jgdrs){
		jugadores = jgdrs
		personajes= pjs
	}
	
	
	def dameRival(DetalleJugadorDuelo retador) {
		val rival= jugadores.findFirst[jugador|puedeJugar(jugador.ranking(),retador.jugador.ranking())&& !jugador.equals(retador.jugador)
		]
		Collections.shuffle(jugadores);
		if (rival!=null) {
			var pjElegido = determinarPersonaje(retador.pj) 
			return new DetalleJugadorDuelo(rival,pjElegido,pjElegido.posIdeal)
		}
		return null
	}
	
	def puedeJugar(int rankingRival, int rankingJugador) {
		rankingRival >= rankingJugador-100 && rankingRival<= rankingJugador +100
	}
	
	def determinarPersonaje(Personaje personajeRetador){
		val personaje= personajes.findFirst[personaje|!personaje.equals(personajeRetador)]
		Collections.shuffle(personajes)
		personaje
	}
	
	def agregarJugador(Jugador jugador){
		
		jugadores.add(jugador)
	}
	
	def agregarPersonaje(Personaje personaje) {
		
		personajes.add(personaje)
		
	}
}
