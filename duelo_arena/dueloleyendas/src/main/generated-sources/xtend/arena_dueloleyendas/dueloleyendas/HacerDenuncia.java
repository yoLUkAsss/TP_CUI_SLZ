package arena_dueloleyendas.dueloleyendas;

import appModel.DetalleJugadorDueloAppModel;
import appModel.ResultadoDueloAppModel;
import arena_dueloleyendas.dueloleyendas.CrearResultadoDueloWindow;
import jugador.Jugador;
import jugador.Personaje;
import jugador.Posicion;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class HacerDenuncia extends Application {
  private Jugador j = new Jugador("pedro");
  
  private Personaje p = new Personaje("hola", Posicion.TOP);
  
  public Window<?> createMainWindow() {
    Posicion _posIdeal = this.p.getPosIdeal();
    DetalleJugadorDueloAppModel _detalleJugadorDueloAppModel = new DetalleJugadorDueloAppModel(this.j, this.p, _posIdeal);
    Posicion _posIdeal_1 = this.p.getPosIdeal();
    DetalleJugadorDueloAppModel _detalleJugadorDueloAppModel_1 = new DetalleJugadorDueloAppModel(this.j, this.p, _posIdeal_1);
    ResultadoDueloAppModel _resultadoDueloAppModel = new ResultadoDueloAppModel(_detalleJugadorDueloAppModel, _detalleJugadorDueloAppModel_1);
    return new CrearResultadoDueloWindow(this, _resultadoDueloAppModel);
  }
  
  public static void main(final String[] args) {
    HacerDenuncia _hacerDenuncia = new HacerDenuncia();
    _hacerDenuncia.start();
  }
}
