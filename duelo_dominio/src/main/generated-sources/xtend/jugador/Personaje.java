package jugador;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Personaje {
  private String nombre;
  
  private String posIdeal;
  
  public Personaje(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getPosIdeal() {
    return this.posIdeal;
  }
  
  public void setPosIdeal(final String posIdeal) {
    this.posIdeal = posIdeal;
  }
}
