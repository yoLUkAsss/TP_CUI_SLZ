package arena_dueloleyendas.dueloleyendas


import org.uqbar.arena.Application;
import appModel.DenunciaFacade
import jugador.Jugador
import appModel.ResultadoDueloAppModel
import jugador.Personaje
import util.DetalleJugadorDuelo
import jugador.Posicion
  
class HacerDenuncia extends Application{
	
	var j = new Jugador("pedro")
	var p = new Personaje("hola",Posicion.TOP)
	
	override createMainWindow() {
		new CrearResultadoDueloWindow(this, new ResultadoDueloAppModel(
											new DetalleJugadorDuelo(j,p,p.posIdeal),
											new DetalleJugadorDuelo(j,p,p.posIdeal)
											
		))
	}
	
	def static main(String[] args) {
		new HacerDenuncia().start
	}
}