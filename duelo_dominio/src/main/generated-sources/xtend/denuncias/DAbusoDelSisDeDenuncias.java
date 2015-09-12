package denuncias;

import denuncias.Denuncia;

@SuppressWarnings("all")
public class DAbusoDelSisDeDenuncias extends Denuncia {
  public DAbusoDelSisDeDenuncias(final String descripcion) {
    super(descripcion);
  }
  
  public Integer getPeso() {
    return Integer.valueOf(25);
  }
  
  public String getMotivo() {
    return "Abuso del sistema de denuncias";
  }
}
