package appModel;

import jugador.Jugador;
import jugador.Personaje;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DetalleJugadorDueloAppModel {
  private Jugador jugador;
  
  private Personaje pj;
  
  private String posElegida;
  
  public DetalleJugadorDueloAppModel(final Jugador jugador, final Personaje pj, final String pos) {
    this.jugador = jugador;
    this.pj = pj;
    this.posElegida = pos;
  }
  
  @Pure
  public Jugador getJugador() {
    return this.jugador;
  }
  
  public void setJugador(final Jugador jugador) {
    this.jugador = jugador;
  }
  
  @Pure
  public Personaje getPj() {
    return this.pj;
  }
  
  public void setPj(final Personaje pj) {
    this.pj = pj;
  }
  
  @Pure
  public String getPosElegida() {
    return this.posElegida;
  }
  
  public void setPosElegida(final String posElegida) {
    this.posElegida = posElegida;
  }
}
