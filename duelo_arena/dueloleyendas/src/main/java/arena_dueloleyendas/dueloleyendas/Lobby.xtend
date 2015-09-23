package arena_dueloleyendas.dueloleyendas

import jugador.Jugador
import jugador.Personaje
import appModel.Duelo
import org.uqbar.arena.Application
import jugador.Posicion
import java.util.Collection
import java.util.List

class Lobby extends Application{
	
	override createMainWindow() {
		var Personaje amumu = new Personaje("Amumu",Posicion.TOP)
		var Jugador pedro = new Jugador("Juaco")
		var Jugador marq = new Jugador("Marquitos")
		var Jugador xPeke = new Jugador("xPeke")
		var List<Personaje> pjsPaJugar = newArrayList
		pjsPaJugar.add(amumu)
		pjsPaJugar.add(new Personaje("Ahri",Posicion.MID))
		pjsPaJugar.add(new Personaje("Olaf",Posicion.JUNGLE))
		pjsPaJugar.add(new Personaje("Cait",Posicion.BOT))
		
		var List<Jugador> jgdrs = newArrayList
		jgdrs.add(marq);jgdrs.add(xPeke)
		pedro.ganeYSoyRetador(amumu,Posicion.TOP)
		
		new CrearLobbyDelJugadorWindow(this, new Duelo(pedro,jgdrs,pjsPaJugar))
	}
	
	def static main(String[] args) {
		new Lobby().start
	}
	
}