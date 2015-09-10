package jugador;

import jugador.Denuncia;

@SuppressWarnings("all")
public class DAbusoDeLenguaje extends Denuncia {
  public DAbusoDeLenguaje(final String descripcion) {
    super(descripcion);
  }
  
  public Integer getPeso() {
    return Integer.valueOf(7);
  }
  
  public String getMotivo() {
    return "Abuso del lenguaje";
  }
}
