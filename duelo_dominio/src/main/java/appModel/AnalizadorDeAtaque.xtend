package appModel

import java.util.Random
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import java.util.ArrayList
import jugador.TipoCalificacion
import jugador.EstadisticaDePersonaje

class AnalizadorDeAtaque {
	
	def valorDeCalificacion(Jugador jugador, Personaje personaje, Posicion posicion) {
		var rand = valorAlAzar()
		if (jugador.experienciaPreviaConElPersonajeEnLaPosicionIdeal(personaje) > 5 && rand >90){
			jugador.setTipoCalificacion(personaje,TipoCalificacion.RAMPAGE)
			return 100
		}
		if (jugador.expPreviaEnPosicion(posicion) > 2 && rand >70) {
			jugador.setTipoCalificacion(personaje,TipoCalificacion.DOMINADOR)
			return 75
		}
		if (rand >50) {
			jugador.setTipoCalificacion(personaje,TipoCalificacion.KILLINGSPRED)
			return 60
		}
		if (personaje.mejorPosicion(posicion) && rand >30) {
			jugador.setTipoCalificacion(personaje,TipoCalificacion.MANCO)
			return 15
		}
		jugador.setTipoCalificacion(personaje,TipoCalificacion.NOOB)
		return 5
	}
	
	def valorAlAzar(){
		 val Random rand = new Random(System.currentTimeMillis());
		 return rand.nextInt(120)
	}
	
	
	
	def poderDeAtaque(Jugador jugador, Personaje personaje, Posicion posicion) {
		
		valorDeCalificacion(jugador,personaje,posicion)+valorDeEstadisticasDelJugador(jugador,personaje)
	}
	
	def valorDeEstadisticasDelJugador(Jugador jugador,Personaje personaje){
	
		var estadistica= jugador.estadisticaDelPersonaje(personaje)
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
			retador.ganeYSoyRetador(personajeRetador,posicionRetador)
			rival.perdiYSoyRival(personajeRival,posicionRival)
		}
		else{
			if (resultadoRetador==resultadoRival){
				retador.empateComoRetador(personajeRetador,posicionRetador)
				rival.empateComoRival(personajeRival,posicionRival)
			}
			else{
				rival.ganeYSoyRival(personajeRival,posicionRival)
			    retador.perdiYSoyRetador(personajeRetador,posicionRetador)
			}
		}
		var s =new Pair(resultadoRetador,resultadoRival) 
		return s
	}
	
	def  factorDeSuerte(){	
		val Random rand = new Random(System.currentTimeMillis());
	  	return rand.nextInt(2)
	 }
    
}
