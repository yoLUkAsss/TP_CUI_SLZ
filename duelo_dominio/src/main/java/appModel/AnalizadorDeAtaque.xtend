package appModel

import java.util.Random
import jugador.Jugador
import jugador.Personaje
import jugador.EstadisticasPj

class AnalizadorDeAtaque {
	
	def valorDeCalificacion(Jugador jugador, Personaje personaje, String posicion) {
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
		 
		 new Random().nextInt(100)
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
		
		valorDeCalificacion(jugador,personaje,string)+estadisticasDelPersonaje(jugador,personaje)
	}
	
	def estadisticasDelPersonaje(Jugador jugador,Personaje personaje){
		var estadistica= jugador.est.findFirst[esta|esta.nombre.equals(personaje.nombre)]
		if (estadistica == null){
			
			  0
		}
		else{
			(estadistica.duelosGanadosNoIniciados+(estadistica.duelosEmpatados/2)-estadistica.derrotasNoIniciadas)*estadistica.duelosIniciados
		}
	}
	
	def realizarDuelo(Jugador retador , Jugador rival ,
					  Personaje personajeRetador , Personaje personajeRival , 
					  String posicionRetador , String posicionRival 
	)
	{   
		var resultadoRetador = (this.poderDeAtaque(retador,personajeRetador,posicionRetador)) * factorDeSuerte()
		var resultadoRival = (this.poderDeAtaque(rival,personajeRival,posicionRival)) * factorDeSuerte()
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
		return resultadoRival
	}
	
	def  factorDeSuerte(){	
	 	   new Random().nextInt(1)
	 }
    
}
