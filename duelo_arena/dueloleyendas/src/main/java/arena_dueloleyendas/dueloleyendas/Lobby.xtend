package arena_dueloleyendas.dueloleyendas

import jugador.Jugador
import jugador.Personaje
import appModel.LobbyAppModel
import org.uqbar.arena.Application
import jugador.Posicion
import java.util.List

class Lobby extends Application{
	
	override createMainWindow() {
		var Personaje amumu = new Personaje("Amumu",Posicion.TOP)
		var Personaje ahri = new Personaje("Ahri",Posicion.MID)
		var Personaje olaf = new Personaje("Olaf",Posicion.JUNGLE)
		var Personaje cait = new Personaje("Caitlyn",Posicion.BOT)
		var Jugador jugadorActual = new Jugador("Juaco")
		var Jugador marq = new Jugador("Marquitos")
		var Jugador xPeke = new Jugador("xPeke")
		var List<Personaje> personajesUtilizables = newArrayList
		
		amumu.agregarNuevaFortaleza("Tanque")
		amumu.agregarNuevaFortaleza("Mago")
		amumu.agregarNuevaDebilidad("Crowd-Control")
		
		ahri.agregarNuevaFortaleza("Mago")
		ahri.agregarNuevaFortaleza("Buena Movilidad")
		ahri.agregarNuevaDebilidad("Amor")
		
		olaf.agregarNuevaFortaleza("Tanque")
		olaf.agregarNuevaFortaleza("Crowd-Control")
		olaf.agregarNuevaDebilidad("Daño Magico")
		olaf.agregarNuevaDebilidad("Velocidad")
		
		cait.agregarNuevaFortaleza("Rango de ataque")
		cait.agregarNuevaDebilidad("Crowd-Control")
		
		
		personajesUtilizables.add(amumu)
		personajesUtilizables.add(ahri)
		personajesUtilizables.add(olaf)
		personajesUtilizables.add(cait)
		
		var List<Jugador> jugadores = newArrayList
		jugadores.add(marq);jugadores.add(xPeke)
		jugadorActual.ganeYSoyRetador(amumu,Posicion.TOP)
		
		new CrearLobbyDelJugadorWindow(this, new LobbyAppModel(jugadorActual,jugadores,personajesUtilizables))
	}
	
	def static main(String[] args) {
		new Lobby().start
	}
	
}