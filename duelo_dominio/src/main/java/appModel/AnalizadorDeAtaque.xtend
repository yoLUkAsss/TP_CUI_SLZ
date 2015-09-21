package appModel

import java.util.Random
import jugador.Jugador
import jugador.Personaje
import jugador.EstadisticasPj
import jugador.Posicion
import java.util.ArrayList

class AnalizadorDeAtaque {
	
	def valorDeCalificacion(Jugador jugador, Personaje personaje, Posicion posicion) {
		var rand = valorAlAzar()
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
	
	def valorAlAzar(){
		 val Random rand = new Random(System.currentTimeMillis());
		 return rand.nextInt(120)
	}
	
	//Determina si la posicion es la posicion ideal del personaje
	def mejorPosi(Personaje personaje, Posicion posicion) {
		personaje.posIdeal.equals(posicion)	
	}
	
	//Retorna la cantidad de veces que utilizo independientemente del personaje
	//en la posicion indicada
	def expPrevPosi(Jugador jugador, Posicion posicion) {
		var estadisticas = jugador.est
		estadisticas.fold(0 ,[cant , estad | cant+ posicionesUsadas(estad,posicion)])
	}
	 
	//Retorna dada una EstadisticaPj, cuantas veces lo utilizo en la posicion indicada
	def posicionesUsadas(EstadisticasPj pj, Posicion posicion) {
		(pj.posicionesUsadas.filter[name | name.equals(posicion)]).size
	}
	
	//Retorna la cantidad de veces que jugo con el personaje, en su pocicion ideal
	def expPreviaIdealPers(Jugador jugador, Personaje personaje, Posicion posicion) {
		var estadistica = jugador.est.findFirst[esta | esta.nombre.equals(personaje.nombre)]
		if (estadistica == null)
			return 0
		return (estadistica.posicionesUsadas.filter[name | name.equals(personaje.posIdeal)]).size
	}
	
	def poderDeAtaque(Jugador jugador, Personaje personaje, Posicion posicion) {
		
		valorDeCalificacion(jugador,personaje,posicion)+estadisticasDelPersonaje(jugador,personaje)
	}
	
	def estadisticasDelPersonaje(Jugador jugador,Personaje personaje){
	
		var estadistica= jugador.est.findFirst[esta|esta.nombre.equals(personaje.nombre)]
		if (estadistica == null){
			 

		     return 0
		}
		else{
			
			 return (((estadistica.duelosGanadosNoIniciados+estadistica.duelosEmpatados)/2)-estadistica.derrotasNoIniciadas)*estadistica.duelosIniciados
		}
		
	  
		
	}
	
	def realizarDuelo(Jugador retador , Jugador rival ,
					  Personaje personajeRetador , Personaje personajeRival , 
					  Posicion posicionRetador , Posicion posicionRival ){   
					  	
		var resultadoRetador = (this.poderDeAtaque(retador,personajeRetador,posicionRetador) * factorDeSuerte())
		var resultadoRival = (this.poderDeAtaque(rival,personajeRival,posicionRival) * factorDeSuerte())
		if(resultadoRetador>resultadoRival){	
			retador.ganeYSoyRetador(personajeRetador,posicionRetador,resultadoRetador)
			rival.perdiYSoyRival(personajeRival,posicionRival,resultadoRival)
		}
		else{
			if (resultadoRetador==resultadoRival){
				retador.empate(personajeRetador,posicionRetador,resultadoRetador)
				rival.empate(personajeRival,posicionRival,resultadoRival)
			}
			else{
				rival.ganeYSoyRival(personajeRival,posicionRival,resultadoRival)
			    retador.perdiYSoyRetador(personajeRetador,posicionRetador,resultadoRetador)
			}
		}
		var s =new ArrayList<Integer> 
		s.add(resultadoRetador)
		s.add(resultadoRival)
		return s
	}
	
	def  factorDeSuerte(){	
		val Random rand = new Random(System.currentTimeMillis());
	  	return rand.nextInt(2)
	 }
    
}
