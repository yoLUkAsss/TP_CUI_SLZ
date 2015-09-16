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
  
  private final List<String> col = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("TOP", "BOTTON", "MIDDLE", "JUNGLE"));
  
  private String posicionRetador;
  
  private String posicionRival;
  
  private ArrayList<Jugador> jugadores;
  
  private ArrayList<Personaje> personajes;
  
  private AnalizadorDeAtaque analizador;
  
  private Jugador ganador;
  
  private Jugador perdedor;
  
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
  
  public String determinarRival() {
    try {
      String _xblockexpression = null;
      {
        this.jugadores.remove(this.retador);
        final Function1<Jugador, Boolean> _function = new Function1<Jugador, Boolean>() {
          public Boolean apply(final Jugador jugador) {
            int _ranking = jugador.ranking();
            return Boolean.valueOf(Duelo.this.puedeJugar(Integer.valueOf(_ranking)));
          }
        };
        final Jugador res = IterableExtensions.<Jugador>findFirst(this.jugadores, _function);
        String _xifexpression = null;
        boolean _equals = Objects.equal(res, null);
        if (_equals) {
          throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING");
        } else {
          String _xblockexpression_1 = null;
          {
            this.rival = res;
            this.determinarPersonajeRival();
            _xblockexpression_1 = this.determinarPosicionRival();
          }
          _xifexpression = _xblockexpression_1;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public Personaje determinarPersonajeRival() {
    Personaje _xblockexpression = null;
    {
      this.personajes.remove(this.personajeRetador);
      Random _random = new Random();
      int _size = this.personajes.size();
      int _minus = (_size - 1);
      int _nextInt = _random.nextInt(_minus);
      Personaje _get = this.personajes.get(_nextInt);
      _xblockexpression = this.personajeRival = _get;
    }
    return _xblockexpression;
  }
  
  public String determinarPosicionRival() {
    Random _random = new Random();
    int _size = this.col.size();
    int _minus = (_size - 1);
    int _nextInt = _random.nextInt(_minus);
    String _get = this.col.get(_nextInt);
    return this.posicionRival = _get;
  }
  
  public boolean puedeJugar(final Integer calificacion) {
    boolean _and = false;
    int _ranking = this.retador.ranking();
    int _minus = (_ranking - 100);
    boolean _greaterEqualsThan = ((calificacion).intValue() >= _minus);
    if (!_greaterEqualsThan) {
      _and = false;
    } else {
      int _ranking_1 = this.retador.ranking();
      int _plus = (_ranking_1 + 100);
      boolean _lessEqualsThan = ((calificacion).intValue() <= _plus);
      _and = _lessEqualsThan;
    }
    return _and;
  }
  
  public String jugarContraMRX() {
    String _xblockexpression = null;
    {
      MRX _mRX = new MRX("MR-X");
      this.rival = _mRX;
      this.determinarPersonajeRival();
      _xblockexpression = this.determinarPosicionRival();
    }
    return _xblockexpression;
  }
  
  public Object realizarDuelo() {
    Object _xblockexpression = null;
    {
      final int resultadoRetador = this.resultados(this.retador, this.personajeRetador, this.posicionRetador);
      final int resultadoRival = this.resultados(this.rival, this.personajeRival, this.posicionRival);
      Object _xifexpression = null;
      if ((resultadoRetador > resultadoRival)) {
        Jugador _xblockexpression_1 = null;
        {
          this.retador.ganeYSoyRetador(this.personajeRetador, this.posicionRetador, Integer.valueOf(resultadoRetador));
          this.rival.perdiYSoyRival(this.personajeRival, this.posicionRival, Integer.valueOf(resultadoRival));
          this.ganador = this.retador;
          _xblockexpression_1 = this.perdedor = this.rival;
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Object _xifexpression_1 = null;
        if ((resultadoRetador == resultadoRival)) {
          String _xblockexpression_2 = null;
          {
            this.retador.empate(this.personajeRetador, this.posicionRetador, Integer.valueOf(resultadoRetador));
            this.rival.empate(this.personajeRival, this.posicionRival, Integer.valueOf(resultadoRival));
            String _nombre = this.rival.getNombre();
            String _plus = ("Empataste con " + _nombre);
            _xblockexpression_2 = this.empate = _plus;
          }
          _xifexpression_1 = _xblockexpression_2;
        } else {
          Jugador _xblockexpression_3 = null;
          {
            this.rival.ganeYSoyRival(this.personajeRival, this.posicionRival, Integer.valueOf(resultadoRival));
            this.retador.perdiYSoyRetador(this.personajeRetador, this.posicionRetador, Integer.valueOf(resultadoRetador));
            this.ganador = this.rival;
            _xblockexpression_3 = this.perdedor = this.retador;
          }
          _xifexpression_1 = _xblockexpression_3;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public int resultados(final Jugador jugador, final Personaje per, final String pos) {
    int _poderDeAtaque = this.analizador.poderDeAtaque(jugador, per, pos);
    int _factorDeSuerte = this.factorDeSuerte();
    return (_poderDeAtaque * _factorDeSuerte);
  }
  
  public int factorDeSuerte() {
    Random _random = new Random();
    return _random.nextInt(1);
  }
  
  public boolean agregarJugador(final Jugador jugador) {
    return this.jugadores.add(jugador);
  }
  
  public boolean agregarPersonaje(final Personaje personaje) {
    return this.personajes.add(personaje);
  }
  
  @Pure
  public Jugador getRetador() {
    return this.retador;
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
  public ArrayList<Jugador> getJugadores() {
    return this.jugadores;
  }
  
  public void setJugadores(final ArrayList<Jugador> jugadores) {
    this.jugadores = jugadores;
  }
  
  @Pure
  public ArrayList<Personaje> getPersonajes() {
    return this.personajes;
  }
  
  public void setPersonajes(final ArrayList<Personaje> personajes) {
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
  public Jugador getGanador() {
    return this.ganador;
  }
  
  public void setGanador(final Jugador ganador) {
    this.ganador = ganador;
  }
  
  @Pure
  public Jugador getPerdedor() {
    return this.perdedor;
  }
  
  public void setPerdedor(final Jugador perdedor) {
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
