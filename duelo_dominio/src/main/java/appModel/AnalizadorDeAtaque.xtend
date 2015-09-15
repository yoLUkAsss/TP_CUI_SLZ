package appModel

import java.util.Random
import jugador.Jugador
import jugador.Personaje
import jugador.EstadisticasPj

class AnalizadorDeAtaque {
	
	def valorDeClasificacion(Jugador jugador, Personaje personaje, String posicion) {
		var rand = new Random().nextInt(100)
		if (expPreviaIdealPers(jugador,personaje,posicion) > 5 && rand >90)
			return 100
		if (expPrevPosi(jugador,posicion) > 2 && rand >70)
			return 75
		if (rand >50)
			return 60
		if (mejorPosi(personaje,posicion) && rand >30)
			return 15
		return 5
	}
	
	//Determina si la posicion es la posicion ideal del personaje
	def mejorPosi(Personaje personaje, String posicion) {
		personaje.posIdeal.equals(posicion)	
	}
	
	//Retorna la cantidad de veces que utilizo independientemente del personaje
	//en la posicion indicada
	def expPrevPosi(Jugador jugador, String posicion) {
		var estadisticas = jugador.est
		estadisticas.fold(0 ,[cant , estad | cant+ posicionesUsadas(estad,posicion)])
	}
	 
	//Retorna dada una EstadisticaPj, cuantas veces lo utilizo en la posicion indicada
	def posicionesUsadas(EstadisticasPj pj, String posicion) {
		(pj.posicionesUsadas.filter[name | name.equals(posicion)]).size
	}
	
	//Retorna la cantidad de veces que jugo con el personaje, en su pocicion ideal
	def expPreviaIdealPers(Jugador jugador, Personaje personaje, String posicion) {
		var estadistica = jugador.est.findFirst[esta | esta.nombre.equals(personaje.nombre)]
		if (estadistica == null)
			return 0
		return (estadistica.posicionesUsadas.filter[name | name.equals(personaje.posIdeal)]).size
	}
	
	def poderDeAtaque(Jugador jugador, Personaje personaje, String string) {
		
	}
	
	

}
