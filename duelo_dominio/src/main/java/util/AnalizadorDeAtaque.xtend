package util

import java.util.Random
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import jugador.TipoCalificacion

/**
 * Este objeto es el encargado de analizar, valga la redundancia, de los jugadores batidos a duelo y 
 * tambien de retornar la informacion necesaria acorde a el resultado final de dicho duelo.
 * 
 * @author Sandoval Lucas
 * @author Leutwyler Nicolas
 * @author Zaracho Nicolas
 * 
 */
class AnalizadorDeAtaque {
	
	
	/**
	 * Dada la eleccion de un personaje en una posicion, un jugador especifico, verifica ciertas 
	 * condiciones a cumplir y de acuerdo a estas (sumado a un valor random) modifica el valor de
	 * calificacion de dicho jugador.
	 * 
	 * @param jugador El jugador a evaluar
	 * @param personaje El personaje elegido para evaluar
	 * @param posicion Posicion elegida para el duelo
	 * 
	 * @return valor de calificacion obtenida
	 * 
	 * @see Jugador
	 * @see Personaje
	 * @see Posicion
	 */
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
	
	/**
	 * Retorna el poder de ataque de un jugador, con un personaje elegido en una posicion elegida
	 * Este valor es: valor de calificacion (con los mismos datos) + valor de estadisticas del jugador
	 * 
	 * @param jugador El jugador a evaluar
	 * @param personaje El personaje elegido para evaluar
	 * @param posicion Posicion elegida para el duelo
	 * 
	 * @return El poder de ataque: valor de calificacion + valor de las estadisticas del jugador
	 */	
	def poderDeAtaque(Jugador jugador, Personaje personaje, Posicion posicion) {
		valorDeCalificacion(jugador,personaje,posicion)+valorDeEstadisticasDelJugador(jugador,personaje)
	}
	
	/**
	 * Obtiene el valor de estadisticas de un jugador con un personaje seleccionado
	 * 
	 * @param jugador El jugador a evaluar
	 * @param personaje El personaje elegido para evaluar
	 * 
	 * @return Si el jugador poseia una estadistica 
	 * valor = (((duelos ganados no iniciados + duelos empatados) / 2)  - derrotas no inciadas) * duelos iniciados
	 * o 0 en caso contrario
	 * 
	 *  
	 */
	def valorDeEstadisticasDelJugador(Jugador jugador,Personaje personaje){	
		var estadistica= jugador.estadisticaDelPersonaje(personaje)
		if (estadistica == null)
		     return 0
		return (((estadistica.duelosGanadosNoIniciados+estadistica.duelosEmpatados)/2)-estadistica.derrotasNoIniciadas)*estadistica.duelosIniciados
	}
	
	/**
	 * Metodo encargado de simular un duelo y crear la informacion necesaria, ganador y perdedor
	 * valores de resultado, si hubo empate, etc.
	 * 
	 * @param retador Jugador retador
	 * @param rival Jugador rival
	 * @param personajeRetador Personaje elegido por el retador
	 * @param personajeRival idem anterior
	 * @param posicionRetador Posicion elegida por el retador
	 * @param posicionRival idem anterior
	 * 
	 * @return El resultado del duelo
	 * 
	 */ 
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
	
	/**
	 * Valor utilizado en realizarDuelo
	 * 
	 * @return valor random entre 0 y 2 exclusivo (entro 0 y 1)
	 */
	def  factorDeSuerte(){	
		return numeroRandomEntreCeroY(2)
	}
	
	/**
	 * Valor utilizado en valorDeCalificacion
	 * 
	 * @return Un numero random entre 0 y 120 exclusivo (entre 0 y 119)
	 */
	def valorAlAzar(){
		 return numeroRandomEntreCeroY(120)
	}
	
	/**
	 * Parametrizacion para obtener numeros random entre 0 y un valor ingresado
	 * 
	 * @param cotaSuperior Cota superior del intervalo
	 * 
	 * @return un valor random entre 0 y la cota exclusivo
	 * 
	 */
	def private numeroRandomEntreCeroY(int cotaSuperior) {
		val Random rand = new Random(System.currentTimeMillis());
		return rand.nextInt(cotaSuperior)
	}
    
}
