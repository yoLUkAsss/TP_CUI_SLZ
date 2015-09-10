package jugador;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import jugador.AnalizadorDeAtaque;
import jugador.Jugador;
import jugador.MRX;
import jugador.Personaje;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
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
  
  private ArrayList<Jugador> jugadores;
  
  private ArrayList<Personaje> personajes;
  
  private AnalizadorDeAtaque analizador;
  
  public Duelo(final Jugador jugador) {
    this.retador = jugador;
  }
  
  public Personaje elegirPersonajeRetador(final Personaje personaje) {
    return this.personajeRetador = personaje;
  }
  
  public String elegirPosicionRetador(final String posicion) {
    return this.posicionRetador = posicion;
  }
  
  public Jugador determinarRival() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method get is undefined for the type Duelo"
      + "\nType mismatch: cannot convert from Object to Iterable<Jugador>");
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
  
  public boolean hayJugadores(final Iterable<Jugador> jugadors) {
    boolean _isEmpty = IterableExtensions.isEmpty(jugadors);
    return (!_isEmpty);
  }
  
  public Object jugadoresDelMismoEscalon() {
    return null;
  }
  
  public Jugador jugarContraMRX() {
    MRX _mRX = new MRX();
    return this.rival = _mRX;
  }
  
  public Jugador realizarDuelo() {
    Jugador _xifexpression = null;
    float _resultados = this.resultados(this.retador, this.personajeRetador, this.posicionRetador);
    float _resultados_1 = this.resultados(this.rival, this.personajeRival, this.posicionRival);
    boolean _greaterThan = (_resultados > _resultados_1);
    if (_greaterThan) {
      _xifexpression = this.retador;
    } else {
      _xifexpression = this.rival;
    }
    return _xifexpression;
  }
  
  public float resultados(final Jugador jugador, final Personaje per, final String pos) {
    int _poderDeAtaque = this.analizador.poderDeAtaque(jugador, per, pos);
    float _factorDeSuerte = this.factorDeSuerte();
    return (_poderDeAtaque * _factorDeSuerte);
  }
  
  public float factorDeSuerte() {
    Random _random = new Random();
    return _random.nextInt(1);
  }
  
  public int elegirElementoAlAzar(final ArrayList<Object> lista) {
    Random _random = new Random();
    int _size = lista.size();
    int _minus = (_size - 1);
    return _random.nextInt(_minus);
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
}
