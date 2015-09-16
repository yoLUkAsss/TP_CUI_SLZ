package appModel

import excepciones.NoHayRivalException
import java.util.Collection
import jugador.EstadisticasPj
import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Duelo {
	//jugadores
	Jugador jugador
	DetalleJugadorDueloAppModel retador
	DetalleJugadorDueloAppModel rival
	
	//personajes 
	Personaje personajeRetador
	//tengo las posiciones en el juego 
	Collection<EstadisticasPj> estadisticas
	
	//pos
	String pos

	new(Jugador jugador){
	    this.jugador=jugador
	    this.pos=pos
	    this.estadisticas = jugador.est 
		
	}
	
	
	
	def iniciarDuelo(String pos){
		retador = new DetalleJugadorDueloAppModel(jugador,personajeRetador,pos)
		rival= new SelectorDeRivalAppModel().dameRival(retador)
			if (rival==null){
				throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		return new ResultadoDueloAppModel(rival,retador)
	}
	
	def retarAMRX(){
		
		
	}
	
	
}
