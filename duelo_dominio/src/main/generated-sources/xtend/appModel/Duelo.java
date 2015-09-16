package appModel;

import appModel.DetalleJugadorDueloAppModel;
import appModel.ResultadoDueloAppModel;
import appModel.SelectorDeRivalAppModel;
import com.google.common.base.Objects;
import excepciones.NoHayRivalException;
import java.util.Collection;
import jugador.EstadisticasPj;
import jugador.Jugador;
import jugador.Personaje;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Duelo {
  private Jugador jugador;
  
  private DetalleJugadorDueloAppModel retador;
  
  private DetalleJugadorDueloAppModel rival;
  
  private Personaje personajeRetador;
  
  private Collection<EstadisticasPj> estadisticas;
  
  private String pos;
  
  public Duelo(final Jugador jugador) {
    this.jugador = jugador;
    this.pos = this.pos;
    Collection<EstadisticasPj> _est = jugador.getEst();
    this.estadisticas = _est;
  }
  
  public ResultadoDueloAppModel iniciarDuelo(final String pos) {
    try {
      DetalleJugadorDueloAppModel _detalleJugadorDueloAppModel = new DetalleJugadorDueloAppModel(this.jugador, this.personajeRetador, pos);
      this.retador = _detalleJugadorDueloAppModel;
      SelectorDeRivalAppModel _selectorDeRivalAppModel = new SelectorDeRivalAppModel();
      DetalleJugadorDueloAppModel _dameRival = _selectorDeRivalAppModel.dameRival(this.retador);
      this.rival = _dameRival;
      boolean _equals = Objects.equal(this.rival, null);
      if (_equals) {
        throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING");
      }
      return new ResultadoDueloAppModel(this.rival, this.retador);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public Object retarAMRX() {
    return null;
  }
  
  @Pure
  public Jugador getJugador() {
    return this.jugador;
  }
  
  public void setJugador(final Jugador jugador) {
    this.jugador = jugador;
  }
  
  @Pure
  public DetalleJugadorDueloAppModel getRetador() {
    return this.retador;
  }
  
  public void setRetador(final DetalleJugadorDueloAppModel retador) {
    this.retador = retador;
  }
  
  @Pure
  public DetalleJugadorDueloAppModel getRival() {
    return this.rival;
  }
  
  public void setRival(final DetalleJugadorDueloAppModel rival) {
    this.rival = rival;
  }
  
  @Pure
  public Personaje getPersonajeRetador() {
    return this.personajeRetador;
  }
  
  public void setPersonajeRetador(final Personaje personajeRetador) {
    this.personajeRetador = personajeRetador;
  }
  
  @Pure
  public Collection<EstadisticasPj> getEstadisticas() {
    return this.estadisticas;
  }
  
  public void setEstadisticas(final Collection<EstadisticasPj> estadisticas) {
    this.estadisticas = estadisticas;
  }
  
  @Pure
  public String getPos() {
    return this.pos;
  }
  
  public void setPos(final String pos) {
    this.pos = pos;
  }
}
