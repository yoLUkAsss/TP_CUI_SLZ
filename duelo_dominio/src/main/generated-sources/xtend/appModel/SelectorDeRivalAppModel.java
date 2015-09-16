package appModel;

import appModel.DetalleJugadorDueloAppModel;
import com.google.common.base.Objects;
import java.util.Collection;
import jugador.Jugador;
import jugador.Personaje;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class SelectorDeRivalAppModel {
  private Collection<Jugador> jugadores;
  
  private Collection<Personaje> personajes;
  
  public DetalleJugadorDueloAppModel dameRival(final DetalleJugadorDueloAppModel retador) {
    final Function1<Jugador, Boolean> _function = new Function1<Jugador, Boolean>() {
      public Boolean apply(final Jugador jugador) {
        boolean _and = false;
        int _ranking = jugador.ranking();
        Jugador _jugador = retador.getJugador();
        int _ranking_1 = _jugador.ranking();
        boolean _puedeJugar = SelectorDeRivalAppModel.this.puedeJugar(_ranking, _ranking_1);
        if (!_puedeJugar) {
          _and = false;
        } else {
          Jugador _jugador_1 = retador.getJugador();
          boolean _equals = jugador.equals(_jugador_1);
          boolean _not = (!_equals);
          _and = _not;
        }
        return Boolean.valueOf(_and);
      }
    };
    final Jugador rival = IterableExtensions.<Jugador>findFirst(this.jugadores, _function);
    boolean _equals = Objects.equal(rival, null);
    if (_equals) {
      return null;
    } else {
      Personaje _pj = retador.getPj();
      Personaje _determinarPersonaje = this.determinarPersonaje(_pj);
      Personaje _pj_1 = retador.getPj();
      Personaje _determinarPersonaje_1 = this.determinarPersonaje(_pj_1);
      String _posIdeal = _determinarPersonaje_1.getPosIdeal();
      return new DetalleJugadorDueloAppModel(rival, _determinarPersonaje, _posIdeal);
    }
  }
  
  public boolean puedeJugar(final int rankingRival, final int rankingJugador) {
    return ((rankingRival >= (rankingJugador - 100)) && (rankingJugador <= rankingJugador));
  }
  
  public Personaje determinarPersonaje(final Personaje personajeRetador) {
    Personaje _xblockexpression = null;
    {
      final Function1<Personaje, Boolean> _function = new Function1<Personaje, Boolean>() {
        public Boolean apply(final Personaje personaje) {
          return Boolean.valueOf((!Objects.equal(personaje, personajeRetador)));
        }
      };
      final Personaje personaje = IterableExtensions.<Personaje>findFirst(this.personajes, _function);
      _xblockexpression = personaje;
    }
    return _xblockexpression;
  }
}
