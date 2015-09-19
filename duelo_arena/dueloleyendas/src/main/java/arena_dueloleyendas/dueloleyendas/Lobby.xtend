package arena_dueloleyendas.dueloleyendas

import jugador.Jugador
import jugador.Personaje
import appModel.Duelo
import org.uqbar.arena.Application

class Lobby extends Application{
	
	override createMainWindow() {
		var Personaje amumu = new Personaje("Amumu","asd")
		var Jugador pedro = new Jugador("Juaco")
		pedro.ganeYSoyRetador(amumu,"asd",45)
		new CrearLobbyDelJugadorWindow(this, new Duelo(pedro))
	}
	
	def static main(String[] args) {
		new Lobby().start
	}
	
}