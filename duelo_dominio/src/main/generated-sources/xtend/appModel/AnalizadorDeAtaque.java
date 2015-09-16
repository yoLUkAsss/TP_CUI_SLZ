package appModel;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Random;
import jugador.EstadisticasPj;
import jugador.Jugador;
import jugador.Personaje;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class AnalizadorDeAtaque {
  public int valorDeClasificacion(final Jugador jugador, final Personaje personaje, final String posicion) {
    Random _random = new Random();
    int rand = _random.nextInt(100);
    boolean _and = false;
    int _expPreviaIdealPers = this.expPreviaIdealPers(jugador, personaje, posicion);
    boolean _greaterThan = (_expPreviaIdealPers > 5);
    if (!_greaterThan) {
      _and = false;
    } else {
      _and = (rand > 90);
    }
    if (_and) {
      return 100;
    }
    boolean _and_1 = false;
    Integer _expPrevPosi = this.expPrevPosi(jugador, posicion);
    boolean _greaterThan_1 = ((_expPrevPosi).intValue() > 2);
    if (!_greaterThan_1) {
      _and_1 = false;
    } else {
      _and_1 = (rand > 70);
    }
    if (_and_1) {
      return 75;
    }
    if ((rand > 50)) {
      return 60;
    }
    boolean _and_2 = false;
    boolean _mejorPosi = this.mejorPosi(personaje, posicion);
    if (!_mejorPosi) {
      _and_2 = false;
    } else {
      _and_2 = (rand > 30);
    }
    if (_and_2) {
      return 15;
    }
    return 5;
  }
  
  public boolean mejorPosi(final Personaje personaje, final String posicion) {
    String _posIdeal = personaje.getPosIdeal();
    return _posIdeal.equals(posicion);
  }
  
  public Integer expPrevPosi(final Jugador jugador, final String posicion) {
    Integer _xblockexpression = null;
    {
      Collection<EstadisticasPj> estadisticas = jugador.getEst();
      final Function2<Integer, EstadisticasPj, Integer> _function = new Function2<Integer, EstadisticasPj, Integer>() {
        public Integer apply(final Integer cant, final EstadisticasPj estad) {
          int _posicionesUsadas = AnalizadorDeAtaque.this.posicionesUsadas(estad, posicion);
          return Integer.valueOf(((cant).intValue() + _posicionesUsadas));
        }
      };
      _xblockexpression = IterableExtensions.<EstadisticasPj, Integer>fold(estadisticas, Integer.valueOf(0), _function);
    }
    return _xblockexpression;
  }
  
  public int posicionesUsadas(final EstadisticasPj pj, final String posicion) {
    ArrayList<String> _posicionesUsadas = pj.getPosicionesUsadas();
    final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
      public Boolean apply(final String name) {
        return Boolean.valueOf(name.equals(posicion));
      }
    };
    Iterable<String> _filter = IterableExtensions.<String>filter(_posicionesUsadas, _function);
    return IterableExtensions.size(_filter);
  }
  
  public int expPreviaIdealPers(final Jugador jugador, final Personaje personaje, final String posicion) {
    Collection<EstadisticasPj> _est = jugador.getEst();
    final Function1<EstadisticasPj, Boolean> _function = new Function1<EstadisticasPj, Boolean>() {
      public Boolean apply(final EstadisticasPj esta) {
        String _nombre = esta.getNombre();
        String _nombre_1 = personaje.getNombre();
        return Boolean.valueOf(_nombre.equals(_nombre_1));
      }
    };
    EstadisticasPj estadistica = IterableExtensions.<EstadisticasPj>findFirst(_est, _function);
    boolean _equals = Objects.equal(estadistica, null);
    if (_equals) {
      return 0;
    }
    ArrayList<String> _posicionesUsadas = estadistica.getPosicionesUsadas();
    final Function1<String, Boolean> _function_1 = new Function1<String, Boolean>() {
      public Boolean apply(final String name) {
        String _posIdeal = personaje.getPosIdeal();
        return Boolean.valueOf(name.equals(_posIdeal));
      }
    };
    Iterable<String> _filter = IterableExtensions.<String>filter(_posicionesUsadas, _function_1);
    return IterableExtensions.size(_filter);
  }
  
  public int poderDeAtaque(final Jugador jugador, final Personaje personaje, final String string) {
    int _valorDeClasificacion = this.valorDeClasificacion(jugador, personaje, string);
    int _estadisticasDelPersonaje = this.estadisticasDelPersonaje(jugador, personaje);
    return (_valorDeClasificacion + _estadisticasDelPersonaje);
  }
  
  public int estadisticasDelPersonaje(final Jugador jugador, final Personaje personaje) {
    int _xblockexpression = (int) 0;
    {
      Collection<EstadisticasPj> _est = jugador.getEst();
      final Function1<EstadisticasPj, Boolean> _function = new Function1<EstadisticasPj, Boolean>() {
        public Boolean apply(final EstadisticasPj esta) {
          String _nombre = esta.getNombre();
          String _nombre_1 = personaje.getNombre();
          return Boolean.valueOf(_nombre.equals(_nombre_1));
        }
      };
      EstadisticasPj estadistica = IterableExtensions.<EstadisticasPj>findFirst(_est, _function);
      int _xifexpression = (int) 0;
      boolean _equals = Objects.equal(estadistica, null);
      if (_equals) {
        _xifexpression = 0;
      } else {
        Integer _duelosGanadosNoIniciados = estadistica.getDuelosGanadosNoIniciados();
        Integer _duelosEmpatados = estadistica.getDuelosEmpatados();
        int _plus = ((_duelosGanadosNoIniciados).intValue() + (_duelosEmpatados).intValue());
        int _divide = (_plus / 2);
        Integer _derrotasNoIniciadas = estadistica.getDerrotasNoIniciadas();
        int _minus = (_divide - (_derrotasNoIniciadas).intValue());
        Integer _duelosIniciados = estadistica.getDuelosIniciados();
        _xifexpression = (_minus * (_duelosIniciados).intValue());
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public int realizarDuelo(final Jugador retador, final Jugador rival, final Personaje personajeRetador, final Personaje personajeRival, final String posicionRetador, final String posicionRival) {
    int _poderDeAtaque = this.poderDeAtaque(retador, personajeRetador, posicionRetador);
    int _factorDeSuerte = this.factorDeSuerte();
    int resultadoRetador = (_poderDeAtaque * _factorDeSuerte);
    int _poderDeAtaque_1 = this.poderDeAtaque(rival, personajeRival, posicionRival);
    int _factorDeSuerte_1 = this.factorDeSuerte();
    int resultadoRival = (_poderDeAtaque_1 * _factorDeSuerte_1);
    if ((resultadoRetador > resultadoRival)) {
      retador.ganeYSoyRetador(personajeRetador, posicionRetador, Integer.valueOf(resultadoRetador));
      rival.perdiYSoyRival(personajeRival, posicionRival, Integer.valueOf(resultadoRival));
    } else {
      if ((resultadoRetador == resultadoRival)) {
        retador.empate(personajeRetador, posicionRetador, Integer.valueOf(resultadoRetador));
        rival.empate(personajeRival, posicionRival, Integer.valueOf(resultadoRival));
      } else {
        rival.ganeYSoyRival(personajeRival, posicionRival, Integer.valueOf(resultadoRival));
        retador.perdiYSoyRetador(personajeRetador, posicionRetador, Integer.valueOf(resultadoRetador));
      }
    }
    return resultadoRival;
  }
  
  public int factorDeSuerte() {
    Random _random = new Random();
    return _random.nextInt(1);
  }
}
