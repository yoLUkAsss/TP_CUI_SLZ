package util

import jugador.Jugador
import jugador.Personaje
import util.DetalleJugadorDuelo
import java.util.Collections
import java.util.List

/**
 * Este objeto es el encargado de armar un Jugador rival, y un personaje elegidos al azar, 
 * y armarlo como un posible contrincante
 * 
 * @author Sandoval Lucas
 * @author Leutwyler Nicolas
 * @author Zaracho Nicolas
 */
class SelectorDeRival {
	
	
	List<Jugador> jugadores
	List<Personaje> personajes
	
	
	new(List<Personaje> pjs,List<Jugador> jgdrs){
		jugadores = jgdrs
		personajes= pjs
	}
	
	/**
	 * Evalua segun ranking y obtiene algun retador
	 * 
	 * @param retador Es el jugador quien inicia un duelo, y con el que definiremos su rival
	 * 
	 * @return Un Detalle de Jugador para el rival, empaquetando su informacion, en caso de no encontrarlo retorna null
	 * 
	 * @see DetalleJugadorDuelo
	 */
	def dameRival(DetalleJugadorDuelo retador) {
		val rival= jugadores.findFirst[jugador|puedeJugar(jugador.ranking(),retador.jugador.ranking())&& !jugador.equals(retador.jugador)
		]
		Collections.shuffle(jugadores);
		if (rival!=null) {
			var pjElegido = determinarPersonaje(retador.pj) 
			return new DetalleJugadorDuelo(rival,pjElegido,pjElegido.getPosicionIdeal)
		}
		return null
	}
	
	/**
	 * Dado dos rankings informa si su diferencia es de 100 o menos
	 * 
	 * @param rankingRival Es el ranking del un jugador rival
	 * @param rankingRetador idem anterior del retador
	 * 
	 * @return true si su diferencia es menor o igual a 100, false caso contrario
	 */
	def puedeJugar(int rankingRival, int rankingRetador) {
		return (Math.abs(rankingRival-rankingRetador) <= 100)
	}
	
	/**
	 * Dado un personaje, retorna alguno distinto de este
	 * 
	 * @param personajeRetador
	 * 
	 * @return otro personaje distinto del ingresado
	 */
	def determinarPersonaje(Personaje personajeRetador){
		val personaje= personajes.findFirst[personaje|!personaje.equals(personajeRetador)]
		Collections.shuffle(personajes)
		personaje
	}
	
	/**
	 * Agrega un jugador al listado de jugadores actual
	 * 
	 * @param jugador Jugador a agregar
	 */
	def agregarJugador(Jugador jugador){
		jugadores.add(jugador)
	}
	
	/**
	 * Agrega un personaje al listado de personajes actual
	 * 
	 * @param personaje Personaje nuevo a agregar
	 */
	def agregarPersonaje(Personaje personaje) {
		personajes.add(personaje)
	}
}
