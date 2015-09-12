package appModelTests;

import appModel.Duelo;
import java.util.List;
import jugador.Jugador;
import jugador.Personaje;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

@SuppressWarnings("all")
public class DueloTest {
  private Jugador retador;
  
  private Jugador j1;
  
  private Jugador j2;
  
  private Jugador j3;
  
  private Personaje p1;
  
  private Personaje p2;
  
  private Personaje p3;
  
  private Duelo duelo;
  
  @Before
  public void init() {
    Jugador _mock = Mockito.<Jugador>mock(Jugador.class);
    this.retador = _mock;
    Jugador _mock_1 = Mockito.<Jugador>mock(Jugador.class);
    this.j1 = _mock_1;
    Jugador _mock_2 = Mockito.<Jugador>mock(Jugador.class);
    this.j2 = _mock_2;
    Jugador _mock_3 = Mockito.<Jugador>mock(Jugador.class);
    this.j3 = _mock_3;
    Personaje _mock_4 = Mockito.<Personaje>mock(Personaje.class);
    this.p1 = _mock_4;
    Personaje _mock_5 = Mockito.<Personaje>mock(Personaje.class);
    this.p2 = _mock_5;
    Personaje _mock_6 = Mockito.<Personaje>mock(Personaje.class);
    this.p3 = _mock_6;
    Duelo _duelo = new Duelo(this.retador);
    this.duelo = _duelo;
    List<Jugador> _jugadores = this.duelo.getJugadores();
    _jugadores.add(this.j1);
    List<Jugador> _jugadores_1 = this.duelo.getJugadores();
    _jugadores_1.add(this.j2);
    List<Jugador> _jugadores_2 = this.duelo.getJugadores();
    _jugadores_2.add(this.j3);
    List<Personaje> _personajes = this.duelo.getPersonajes();
    _personajes.add(this.p1);
    List<Personaje> _personajes_1 = this.duelo.getPersonajes();
    _personajes_1.add(this.p2);
    List<Personaje> _personajes_2 = this.duelo.getPersonajes();
    _personajes_2.add(this.p3);
  }
  
  @Test
  public void test() {
    Assert.assertTrue(true);
  }
}
