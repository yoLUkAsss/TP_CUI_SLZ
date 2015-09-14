package arena_dueloleyendas.dueloleyendas


import org.uqbar.arena.Application;
import appModel.DenunciaFacade

class HacerDenuncia extends Application{
	
	
	override createMainWindow() {
		new CrearHacerDenunciaWindow(this, new DenunciaFacade)
	}
	
	def static main(String[] args) {
		new HacerDenuncia().start
	}
}