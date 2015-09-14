package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.List
import jugador.Jugador
import jugador.Personaje
import jugador.MRX
import excepciones.NoHayRivalException

@Accessors

class Duelo {
	//jugadores
	Jugador retador
	Jugador rival
	//personajes 
	Personaje personajeRetador
	Personaje personajeRival
	//tengo las posiciones en el juego 
	 val col =#["TOP","BOTTON","MIDDLE","JUNGLE"]
	
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
		jugadores.remove(rival)
		val Jugador res= jugadores.findFirst[jugador|puedeJugar(jugador.ranking())]
		if (res==null) {
			throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
			
		}
		else{
			 rival= res
			 determinarPersonajeRival()
			 determinarPosicionRival()
		}
	
		
	}
	


	def determinarPersonajeRival(){
		personajes.remove(personajeRetador)
		personajeRival= personajes.get(new Random().nextInt(personajes.size-1))
	}
	 
	 
	def determinarPosicionRival() {
		
		posicionRival= col.get(new Random().nextInt(col.size-1))
		
	}
	
	
	
	def puedeJugar(Integer calificacion) {
		
		calificacion >= retador.ranking()-100 && calificacion <= retador.ranking()+100 
	}
	
	def jugarContraMRX(){
		
		rival= new MRX("MR-X") 
		determinarPersonajeRival()
		determinarPosicionRival()
         
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
				
				empate= "Empataste con " + rival.nombre
			}
			else{
				
				rival.ganeYSoyRival(personajeRival,posicionRival,resultadoRival)
			    retador.ganeYSoyRetador(personajeRetador,posicionRetador,resultadoRetador)
			    ganador= rival.nombre
			    perdedor=retador.nombre 
			}
		}
		
	}

	 def  resultados(Jugador jugador,Personaje per,String pos){
		
		analizador.poderDeAtaque(jugador,per,pos)*factorDeSuerte()
		
	}
	
	
	 def  factorDeSuerte(){
	 	
	 	   new Random().nextInt(1)
	 }
	
	
	
	
	def agregarJugador(Jugador jugador){ 
		jugadores.add(jugador)
	}
	
	def agregarPersonaje(Personaje personaje){
		personajes.add(personaje)
	}
	
	
	
	}
