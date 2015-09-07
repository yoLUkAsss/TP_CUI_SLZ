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
	//posiciones	
	Posicion  posicionRetador
	Posicion  posicionRival
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
	
	def elegirPosicionRetador(Posicion posicion){
		
		this.posicionRetador=posicion
	}
	
	//elecciones del rival
	
	def determinarRival(){
		if (hayJugadores(jugadoresDelMismoRanking())){
			rival=jugadoresDelMismoRanking().get(0)
			
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
	
	def jugadoresDelMismoRanking(){
		
		jugadores.filter[jugador|jugador.ranking()==retador.ranking()]
	}
	
	def jugarContraJugadorFantasma(){
		
        //jugarContraJugadorFantasma
	}
	
	def cancelarDuelo(){
		
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
	
	 def  float resultados(Jugador jugador,Personaje per,Posicion pos){
		
		analizador.poderDeAtaque(jugador,per,pos)*factorDeSuerte()
		
	}
	
	
	 def float factorDeSuerte(){
	 	
	 	   new Random().nextInt(1)
	 }
	
	def elegirElementoAlAzar(ArrayList<Object>lista){
		
		 new Random().nextInt(lista.size()-1)
	}
	
	
	}
	
	
	
