package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.List

@Accessors

class Duelo {
	//jugadores
	Jugador retador
	Jugador rival
	//personajes 
	Personaje personajeRetador
	Personaje personajeRival
	//tengo las posiciones en el juego 
	 val col =#["TOP","BOTTON / BOT","MIDDLE / MID","JUNGLE"]
	
	//posiciones	
	String  posicionRetador
	String  posicionRival
	//otros
	List<Jugador>jugadores
	List<Personaje>personajes 
	AnalizadorDeAtaque analizador
	
	String ganador
	String perdedor 
	String empate
	
	new(Jugador jugador){
		retador=jugador
	    jugadores= newArrayList
	    personajes= newArrayList	
	    analizador= new AnalizadorDeAtaque
	}
	
	//Elecciones del retador
	def elegirPersonajeRetador(Personaje personaje){
	     personajeRetador=personaje	
		
	}
	
	def elegirPosicionRetador(String posicion){
		
		this.posicionRetador=posicion
	}
	
	//elecciones del rival
	
	def determinarRival(){
		if (hayJugadores(rivales())) {
			rival=rivales().get(0)
			
		}
		else{
			 throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		}
	
		
	}
	
	def hayJugadores(List<Jugador> jugadors) {
	    !jugadors.empty
	}


	def determinarPersonajeRival(){
		personajes.remove(personajeRetador)
		personajeRival= personajes.get(0)
	}
	
	
	def rivales(){
		
		val rivales= (jugadores.filter[jugador|puedeJugar(jugador.ranking())]) as List<Jugador>
		rivales
		
		
	}
	
	def puedeJugar(Double calificacion) {
		
		calificacion >= retador.ranking()-100 && calificacion <= retador.ranking()+100 
	}
	
	def jugarContraMRX(){
		
		rival= new MRX("MR-X") 
         
	}
	
	
	def realizarDuelo()
	{   
		val resultadoRetador=resultados(retador,personajeRetador,posicionRetador)
		val resultadoRival= resultados(rival,personajeRival,posicionRival)
		
		if(resultadoRetador>resultadoRival){
			
			retador.ganeYSoyRetador(personajeRetador,posicionRetador,resultadoRetador)
			rival.perdiYSoyRival(personajeRival,posicionRival,resultadoRival)
			
			ganador= retador.nombre
			perdedor= rival.nombre
		}
		else
		{
			if (resultadoRetador==resultadoRival){
				
				retador.empate(personajeRetador,posicionRetador,resultadoRetador)
				rival.empate(personajeRival,posicionRival,resultadoRival)
				
				empate= retador.nombre + " " + rival.nombre
			}
			else{
				
				rival.ganeYSoyRival(personajeRival,posicionRival,resultadoRival)
			    retador.ganeYSoyRetador(personajeRetador,posicionRetador,resultadoRetador)
			    ganador= rival.nombre
			    perdedor=retador.nombre 
			}
		}
		
	}

	 def  Integer resultados(Jugador jugador,Personaje per,String pos){
		
		analizador.poderDeAtaque(jugador,per,pos)*factorDeSuerte()
		
	}
	
	
	 def Integer factorDeSuerte(){
	 	
	 	   new Random().nextInt(1)
	 }
	
	def elegirElementoAlAzar(List<Object>lista){
		
		 new Random().nextInt(lista.size()-1)
	}
	
	
	
	
	def getRetador(){
		
		retador
	} 
	
	
	def agregarJugador(Jugador jugador){
		jugadores.add(jugador)
	}
	
	def agregarPersonaje(Personaje personaje){
		personajes.add(personaje)
	}
	
	}
