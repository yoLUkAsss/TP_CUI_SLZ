package denuncias;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Observable
@Accessors
@SuppressWarnings("all")
public abstract class Denuncia {
  private String descripcion;
  
  public Denuncia(final String descripcion) {
    this.descripcion = descripcion;
  }
  
  public Integer sizeDescripcion() {
    return Integer.valueOf(this.descripcion.length());
  }
  
  public abstract Integer getPeso();
  
  public abstract String getMotivo();
  
  @Pure
  public String getDescripcion() {
    return this.descripcion;
  }
  
  public void setDescripcion(final String descripcion) {
    this.descripcion = descripcion;
  }
}
