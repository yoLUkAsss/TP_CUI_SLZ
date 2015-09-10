package jugador;

import jugador.Denuncia;

@SuppressWarnings("all")
public class DFeedIntencional extends Denuncia {
  public DFeedIntencional(final String descripcion) {
    super(descripcion);
  }
  
  public Integer getPeso() {
    return Integer.valueOf(10);
  }
  
  public String getMotivo() {
    return "Feed Intencional";
  }
}
