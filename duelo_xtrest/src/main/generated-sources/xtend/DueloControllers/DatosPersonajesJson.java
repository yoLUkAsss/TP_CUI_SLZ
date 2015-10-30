package DueloControllers;

import java.util.List;
import jugador.EstadisticaDePersonaje;
import jugador.Posicion;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DatosPersonajesJson {
  private String id;
  
  private List<EstadisticaDePersonaje> estadisticasDePersonaje;
  
  private List<Posicion> posiciones;
  
  public DatosPersonajesJson(final String id, final List<EstadisticaDePersonaje> estadisticasDePersonaje, final List<Posicion> posiciones) {
    this.id = id;
    this.estadisticasDePersonaje = estadisticasDePersonaje;
    this.posiciones = posiciones;
  }
  
  @Pure
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
  }
  
  @Pure
  public List<EstadisticaDePersonaje> getEstadisticasDePersonaje() {
    return this.estadisticasDePersonaje;
  }
  
  public void setEstadisticasDePersonaje(final List<EstadisticaDePersonaje> estadisticasDePersonaje) {
    this.estadisticasDePersonaje = estadisticasDePersonaje;
  }
  
  @Pure
  public List<Posicion> getPosiciones() {
    return this.posiciones;
  }
  
  public void setPosiciones(final List<Posicion> posiciones) {
    this.posiciones = posiciones;
  }
}
