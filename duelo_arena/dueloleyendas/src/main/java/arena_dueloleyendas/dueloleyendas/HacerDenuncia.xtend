package arena_dueloleyendas.dueloleyendas


import org.uqbar.arena.Application;
import appModel.DenunciaFacade
import jugador.Jugador

class HacerDenuncia extends Application{
	
	
	override createMainWindow() {
		new CrearHacerDenunciaWindow(this, new DenunciaFacade(new Jugador("Juaco"),new Jugador("xPete")))
	}
	
	def static main(String[] args) {
		new HacerDenuncia().start
	}
}