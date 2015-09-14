package arena_dueloleyendas.dueloleyendas;

import appModel.DenunciaFacade;
import arena_dueloleyendas.dueloleyendas.CrearHacerDenunciaWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class HacerDenuncia extends Application {
  public Window<?> createMainWindow() {
    DenunciaFacade _denunciaFacade = new DenunciaFacade();
    return new CrearHacerDenunciaWindow(this, _denunciaFacade);
  }
  
  public static void main(final String[] args) {
    HacerDenuncia _hacerDenuncia = new HacerDenuncia();
    _hacerDenuncia.start();
  }
}
