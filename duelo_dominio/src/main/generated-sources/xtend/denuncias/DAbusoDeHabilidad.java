package denuncias;

import denuncias.Denuncia;

@SuppressWarnings("all")
public class DAbusoDeHabilidad extends Denuncia {
  public DAbusoDeHabilidad(final String descripcion) {
    super(descripcion);
  }
  
  public Integer getPeso() {
    return Integer.valueOf(5);
  }
  
  public String getMotivo() {
    return "Abuso de habilidad";
  }
}
