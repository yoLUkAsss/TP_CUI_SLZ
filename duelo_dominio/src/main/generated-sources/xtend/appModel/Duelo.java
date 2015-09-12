package appModel;

import appModel.AnalizadorDeAtaque;
import com.google.common.base.Objects;
import excepciones.NoHayRivalException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import jugador.Jugador;
import jugador.MRX;
import jugador.Personaje;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Duelo {
  private Jugador retador;
  
  private Jugador rival;
  
  private Personaje personajeRetador;
  
  private Personaje personajeRival;
  
  private final List<String> col = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("TOP", "BOTTON / BOT", "MIDDLE / MID", "JUNGLE"));
  
  private String posicionRetador;
  
  private String posicionRival;
  
  private List<Jugador> jugadores;
  
  private List<Personaje> personajes;
  
  private AnalizadorDeAtaque analizador;
  
  private String ganador;
  
  private String perdedor;
  
  private String empate;
  
  public Duelo(final Jugador jugador) {
    this.retador = jugador;
    ArrayList<Jugador> _newArrayList = CollectionLiterals.<Jugador>newArrayList();
    this.jugadores = _newArrayList;
    ArrayList<Personaje> _newArrayList_1 = CollectionLiterals.<Personaje>newArrayList();
    this.personajes = _newArrayList_1;
    AnalizadorDeAtaque _analizadorDeAtaque = new AnalizadorDeAtaque();
    this.analizador = _analizadorDeAtaque;
  }
  
  public Personaje elegirPersonajeRetador(final Personaje personaje) {
    return this.personajeRetador = personaje;
  }
  
  public String elegirPosicionRetador(final String posicion) {
    return this.posicionRetador = posicion;
  }
  
  public Jugador determinarRival() {
    try {
      Jugador _xifexpression = null;
      List<Jugador> _rivales = this.rivales();
      boolean _hayJugadores = this.hayJugadores(_rivales);
      if (_hayJugadores) {
        List<Jugador> _rivales_1 = this.rivales();
        Jugador _get = _rivales_1.get(0);
        _xifexpression = this.rival = _get;
      } else {
        throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING");
      }
      return _xifexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public boolean hayJugadores(final List<Jugador> jugadors) {
    boolean _isEmpty = jugadors.isEmpty();
    return (!_isEmpty);
  }
  
  public Personaje determinarPersonajeRival() {
    Personaje _xblockexpression = null;
    {
      this.personajes.remove(this.personajeRetador);
      Personaje _get = this.personajes.get(0);
      _xblockexpression = this.personajeRival = _get;
    }
    return _xblockexpression;
  }
  
  public List<Jugador> rivales() {
    List<Jugador> _xblockexpression = null;
    {
      final Function1<Jugador, Boolean> _function = new Function1<Jugador, Boolean>() {
        public Boolean apply(final Jugador jugador) {
          int _ranking = jugador.ranking();
          return Boolean.valueOf(Duelo.this.puedeJugar(_ranking));
        }
      };
      Iterable<Jugador> _filter = IterableExtensions.<Jugador>filter(this.jugadores, _function);
      final List<Jugador> rivales = ((List<Jugador>) _filter);
      _xblockexpression = rivales;
    }
    return _xblockexpression;
  }
  
  public boolean puedeJugar(final int calificacion) {
    boolean _and = false;
    int _ranking = this.retador.ranking();
    int _minus = (_ranking - 100);
    boolean _greaterEqualsThan = (calificacion >= _minus);
    if (!_greaterEqualsThan) {
      _and = false;
    } else {
      int _ranking_1 = this.retador.ranking();
      int _plus = (_ranking_1 + 100);
      boolean _lessEqualsThan = (calificacion <= _plus);
      _and = _lessEqualsThan;
    }
    return _and;
  }
  
  public Jugador jugarContraMRX() {
    MRX _mRX = new MRX("MR-X");
    return this.rival = _mRX;
  }
  
  public String realizarDuelo() {
    String _xblockexpression = null;
    {
      final Integer resultadoRetador = this.resultados(this.retador, this.personajeRetador, this.posicionRetador);
      final Integer resultadoRival = this.resultados(this.rival, this.personajeRival, this.posicionRival);
      String _xifexpression = null;
      boolean _greaterThan = (resultadoRetador.compareTo(resultadoRival) > 0);
      if (_greaterThan) {
        String _xblockexpression_1 = null;
        {
          this.retador.ganeYSoyRetador(this.personajeRetador, this.posicionRetador, resultadoRetador);
          this.rival.perdiYSoyRival(this.personajeRival, this.posicionRival, resultadoRival);
          String _nombre = this.retador.getNombre();
          this.ganador = _nombre;
          String _nombre_1 = this.rival.getNombre();
          _xblockexpression_1 = this.perdedor = _nombre_1;
        }
        _xifexpression = _xblockexpression_1;
      } else {
        String _xifexpression_1 = null;
        boolean _equals = Objects.equal(resultadoRetador, resultadoRival);
        if (_equals) {
          String _xblockexpression_2 = null;
          {
            this.retador.empate(this.personajeRetador, this.posicionRetador, resultadoRetador);
            this.rival.empate(this.personajeRival, this.posicionRival, resultadoRival);
            String _nombre = this.retador.getNombre();
            String _plus = (_nombre + " ");
            String _nombre_1 = this.rival.getNombre();
            String _plus_1 = (_plus + _nombre_1);
            _xblockexpression_2 = this.empate = _plus_1;
          }
          _xifexpression_1 = _xblockexpression_2;
        } else {
          String _xblockexpression_3 = null;
          {
            this.rival.ganeYSoyRival(this.personajeRival, this.posicionRival, resultadoRival);
            this.retador.ganeYSoyRetador(this.personajeRetador, this.posicionRetador, resultadoRetador);
            String _nombre = this.rival.getNombre();
            this.ganador = _nombre;
            String _nombre_1 = this.retador.getNombre();
            _xblockexpression_3 = this.perdedor = _nombre_1;
          }
          _xifexpression_1 = _xblockexpression_3;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public Integer resultados(final Jugador jugador, final Personaje per, final String pos) {
    int _poderDeAtaque = this.analizador.poderDeAtaque(jugador, per, pos);
    Integer _factorDeSuerte = this.factorDeSuerte();
    return Integer.valueOf((_poderDeAtaque * (_factorDeSuerte).intValue()));
  }
  
  public Integer factorDeSuerte() {
    Random _random = new Random();
    return Integer.valueOf(_random.nextInt(1));
  }
  
  public int elegirElementoAlAzar(final List<Object> lista) {
    Random _random = new Random();
    int _size = lista.size();
    int _minus = (_size - 1);
    return _random.nextInt(_minus);
  }
  
  public Jugador getRetador() {
    return this.retador;
  }
  
  public boolean agregarJugador(final Jugador jugador) {
    return this.jugadores.add(jugador);
  }
  
  public boolean agregarPersonaje(final Personaje personaje) {
    return this.personajes.add(personaje);
  }
  
  public void setRetador(final Jugador retador) {
    this.retador = retador;
  }
  
  @Pure
  public Jugador getRival() {
    return this.rival;
  }
  
  public void setRival(final Jugador rival) {
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
  public Personaje getPersonajeRival() {
    return this.personajeRival;
  }
  
  public void setPersonajeRival(final Personaje personajeRival) {
    this.personajeRival = personajeRival;
  }
  
  @Pure
  public List<String> getCol() {
    return this.col;
  }
  
  @Pure
  public String getPosicionRetador() {
    return this.posicionRetador;
  }
  
  public void setPosicionRetador(final String posicionRetador) {
    this.posicionRetador = posicionRetador;
  }
  
  @Pure
  public String getPosicionRival() {
    return this.posicionRival;
  }
  
  public void setPosicionRival(final String posicionRival) {
    this.posicionRival = posicionRival;
  }
  
  @Pure
  public List<Jugador> getJugadores() {
    return this.jugadores;
  }
  
  public void setJugadores(final List<Jugador> jugadores) {
    this.jugadores = jugadores;
  }
  
  @Pure
  public List<Personaje> getPersonajes() {
    return this.personajes;
  }
  
  public void setPersonajes(final List<Personaje> personajes) {
    this.personajes = personajes;
  }
  
  @Pure
  public AnalizadorDeAtaque getAnalizador() {
    return this.analizador;
  }
  
  public void setAnalizador(final AnalizadorDeAtaque analizador) {
    this.analizador = analizador;
  }
  
  @Pure
  public String getGanador() {
    return this.ganador;
  }
  
  public void setGanador(final String ganador) {
    this.ganador = ganador;
  }
  
  @Pure
  public String getPerdedor() {
    return this.perdedor;
  }
  
  public void setPerdedor(final String perdedor) {
    this.perdedor = perdedor;
  }
  
  @Pure
  public String getEmpate() {
    return this.empate;
  }
  
  public void setEmpate(final String empate) {
    this.empate = empate;
  }
}
