package appModel


import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.Posicion

@Observable
@Accessors
class Duelo {
	//jugadores
	Jugador jugador
	DetalleJugadorDueloAppModel retador
	//personajes
	Collection<Personaje> personajesTotales 
	//tengo las posiciones en el juego 
	Collection<EstadisticasArmadasAppModel> estadisticas = newArrayList
	EstadisticasArmadasAppModel estadisticaSeleccionada
	
	new(Jugador jugador){
	    this.jugador=jugador
	    personajesTotales = newArrayList
	    personajesTotales.add(new Personaje("Amumu",Posicion.TOP))
		personajesTotales.add(new Personaje("Ahri",Posicion.MID))
		personajesTotales.add(new Personaje("Olaf",Posicion.JUNGLE))
		personajesTotales.add(new Personaje("Cait",Posicion.BOT))
	    this.estadisticas = (new PrepareEstadisticasPjsAppModel(jugador.est,personajesTotales)).estadisticasPreparadas 
		this.estadisticaSeleccionada = this.estadisticas.get(0)
		
		//HAY Q SACAR
		
	}
	
	@Observable
	def iniciarDuelo(Posicion pos){
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival= new SelectorDeRivalAppModel().dameRival(retador)
			if (rival==null){
				return null//throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		return new ResultadoDueloAppModel(retador,rival)
	}
	
	@Observable
	def iniciarDueloBot(Posicion pos) {
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival = retador
		return new ResultadoDueloAppModel(retador,rival)
	}
	
	@Observable
	def setAltoGato (Posicion s) {
		estadisticaSeleccionada.estAsociada.mejorUbicacion = s
	}

}
