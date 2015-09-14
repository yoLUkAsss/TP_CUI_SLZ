package appModelTests;

import appModel.Duelo;
import denuncias.DAbusoDeHabilidad;
import denuncias.DAbusoDeLenguaje;
import denuncias.DAbusoDelSisDeDenuncias;
import denuncias.DFeedIntencional;
import java.util.List;
import jugador.Jugador;
import jugador.Personaje;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class DueloTest {
  private Jugador retador;
  
  private Jugador j1;
  
  private Jugador j2;
  
  private Jugador j3;
  
  private Personaje p1;
  
  private Personaje p2;
  
  private Personaje p3;
  
  private DAbusoDeHabilidad d1;
  
  private DAbusoDelSisDeDenuncias d2;
  
  private DFeedIntencional d3;
  
  private DAbusoDeLenguaje d4;
  
  private Duelo duelo;
  
  @Before
  public void init() {
    Jugador _jugador = new Jugador("pepe");
    this.retador = _jugador;
    Jugador _jugador_1 = new Jugador("jose");
    this.j1 = _jugador_1;
    Jugador _jugador_2 = new Jugador("pepita");
    this.j2 = _jugador_2;
    Jugador _jugador_3 = new Jugador("pepito");
    this.j3 = _jugador_3;
    Personaje _personaje = new Personaje("personaje1");
    this.p1 = _personaje;
    Personaje _personaje_1 = new Personaje("personaje2");
    this.p2 = _personaje_1;
    Personaje _personaje_2 = new Personaje("personaje3");
    this.p3 = _personaje_2;
    DAbusoDeHabilidad _dAbusoDeHabilidad = new DAbusoDeHabilidad("denuncia1");
    this.d1 = _dAbusoDeHabilidad;
    DAbusoDelSisDeDenuncias _dAbusoDelSisDeDenuncias = new DAbusoDelSisDeDenuncias("denuncia2");
    this.d2 = _dAbusoDelSisDeDenuncias;
    DFeedIntencional _dFeedIntencional = new DFeedIntencional("denuncia3");
    this.d3 = _dFeedIntencional;
    DAbusoDeLenguaje _dAbusoDeLenguaje = new DAbusoDeLenguaje("denuncia4");
    this.d4 = _dAbusoDeLenguaje;
    Duelo _duelo = new Duelo(this.retador);
    this.duelo = _duelo;
    List<Jugador> _jugadores = this.duelo.getJugadores();
    _jugadores.add(this.retador);
    List<Jugador> _jugadores_1 = this.duelo.getJugadores();
    _jugadores_1.add(this.j1);
    List<Jugador> _jugadores_2 = this.duelo.getJugadores();
    _jugadores_2.add(this.j2);
    List<Jugador> _jugadores_3 = this.duelo.getJugadores();
    _jugadores_3.add(this.j3);
    List<Personaje> _personajes = this.duelo.getPersonajes();
    _personajes.add(this.p1);
    List<Personaje> _personajes_1 = this.duelo.getPersonajes();
    _personajes_1.add(this.p2);
    List<Personaje> _personajes_2 = this.duelo.getPersonajes();
    _personajes_2.add(this.p3);
    this.retador.addDenuncia(this.d1);
    this.retador.addDenuncia(this.d2);
    this.retador.ganeYSoyRetador(this.p1, "TOP", Integer.valueOf(30));
    this.retador.empate(this.p3, "JUNGLE", Integer.valueOf(20));
    this.retador.perdiYSoyRival(this.p3, "TOP", Integer.valueOf(50));
    this.j1.addDenuncia(this.d1);
    this.j1.addDenuncia(this.d2);
    this.j1.ganeYSoyRetador(this.p1, "TOP", Integer.valueOf(30));
    this.j1.empate(this.p3, "JUNGLE", Integer.valueOf(20));
    this.j1.perdiYSoyRival(this.p3, "TOP", Integer.valueOf(50));
    this.j2.addDenuncia(this.d3);
    this.j2.addDenuncia(this.d4);
    this.j2.empate(this.p1, "JUNGLE", Integer.valueOf(25));
    this.j2.ganeYSoyRetador(this.p2, "TOP", Integer.valueOf(60));
    this.j3.addDenuncia(this.d2);
    this.j3.addDenuncia(this.d3);
    this.j3.perdiYSoyRetador(this.p2, "TOP", Integer.valueOf(50));
    this.j3.empate(this.p1, "JUNGLE", Integer.valueOf(60));
  }
  
  @Test
  public void testDatosRetador() {
    this.duelo.elegirPersonajeRetador(this.p1);
    this.duelo.elegirPosicionRetador("TOP");
    Jugador _retador = this.duelo.getRetador();
    Assert.assertEquals(this.retador, _retador);
    Personaje _personajeRetador = this.duelo.getPersonajeRetador();
    Assert.assertEquals(this.p1, _personajeRetador);
    String _posicionRetador = this.duelo.getPosicionRetador();
    Assert.assertEquals("TOP", _posicionRetador);
  }
  
  @Test
  public void testCantidadJugadores() {
    List<Jugador> _jugadores = this.duelo.getJugadores();
    int _size = _jugadores.size();
    Assert.assertEquals(4, _size);
  }
  
  @Test
  public void testProximoRivalJugador1() {
    this.duelo.determinarRival();
    Jugador _rival = this.duelo.getRival();
    Assert.assertEquals(this.j1, _rival);
  }
  
  @Test
  public void testHayRivales() {
    List<Jugador> _rivales = this.duelo.rivales();
    boolean _hayJugadores = this.duelo.hayJugadores(_rivales);
    Assert.assertTrue(_hayJugadores);
  }
  
  @Test
  public void testDatosRival() {
    this.duelo.determinarRival();
    this.duelo.determinarPersonajeRival();
    this.duelo.determinarPosicionRival();
    Jugador _determinarRival = this.duelo.determinarRival();
    Assert.assertEquals(this.j1, _determinarRival);
    Personaje _personajeRival = this.duelo.getPersonajeRival();
    Assert.assertEquals(this.p1, _personajeRival);
    String _posicionRival = this.duelo.getPosicionRival();
    Assert.assertEquals("TOP", _posicionRival);
  }
}
