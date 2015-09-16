package jugador;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Personaje {
  private String nombre;
  
  private String especialidad;
  
  private String debilidad;
  
  private String posIdeal;
  
  public Personaje(final String nombre, final String pos) {
    this.nombre = nombre;
    this.posIdeal = pos;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getEspecialidad() {
    return this.especialidad;
  }
  
  public void setEspecialidad(final String especialidad) {
    this.especialidad = especialidad;
  }
  
  @Pure
  public String getDebilidad() {
    return this.debilidad;
  }
  
  public void setDebilidad(final String debilidad) {
    this.debilidad = debilidad;
  }
  
  @Pure
  public String getPosIdeal() {
    return this.posIdeal;
  }
  
  public void setPosIdeal(final String posIdeal) {
    this.posIdeal = posIdeal;
  }
}
