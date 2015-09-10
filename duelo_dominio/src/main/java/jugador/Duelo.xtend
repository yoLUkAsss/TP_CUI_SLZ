package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.Random

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
	ArrayList<Jugador>jugadores
	ArrayList<Personaje>personajes 
	AnalizadorDeAtaque analizador
	
	new(Jugador jugador){
		retador=jugador
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
		if (hayJugadores(jugadoresDelMismoEscalon())){
			rival=jugadoresDelMismoEscalon().get(0)
			
		}
		else{
			 throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		}
	
		
	}
	
	def determinarPersonajeRival(){
		personajes.remove(personajeRetador)
		personajeRival= personajes.get(0)
	}
	

	
	def hayJugadores(Iterable<Jugador> jugadors) {
		!jugadors.empty
	}
	
	def jugadoresDelMismoEscalon(){
		
		//filtrar 
	}
	
	def jugarContraMRX(){
		
		rival= new MRX() 
         
	}
	
	
	def Jugador realizarDuelo()
	{
		if(resultados(retador,personajeRetador,posicionRetador)>resultados(rival,personajeRival,posicionRival)){
			
			retador
		}
		else
		{
			rival 
		}
		
	}
	
	 def  float resultados(Jugador jugador,Personaje per,String pos){
		
		analizador.poderDeAtaque(jugador,per,pos)*factorDeSuerte()
		
	}
	
	
	 def float factorDeSuerte(){
	 	
	 	   new Random().nextInt(1)
	 }
	
	def elegirElementoAlAzar(ArrayList<Object>lista){
		
		 new Random().nextInt(lista.size()-1)
	}
	
	
	}
	
	
	
