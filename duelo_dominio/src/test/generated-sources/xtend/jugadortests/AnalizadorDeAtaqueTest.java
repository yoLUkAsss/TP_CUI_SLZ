package jugadortests;

import appModel.AnalizadorDeAtaque;
import denuncias.DAbusoDeHabilidad;
import denuncias.DAbusoDeLenguaje;
import denuncias.DAbusoDelSisDeDenuncias;
import denuncias.DFeedIntencional;
import jugador.Jugador;
import jugador.Personaje;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class AnalizadorDeAtaqueTest {
  private Jugador j1;
  
  private Jugador j2;
  
  private Jugador j3;
  
  private DAbusoDeHabilidad d1;
  
  private DAbusoDelSisDeDenuncias d2;
  
  private DFeedIntencional d3;
  
  private DAbusoDeLenguaje d4;
  
  private Personaje p1;
  
  private Personaje p2;
  
  private Personaje p3;
  
  private AnalizadorDeAtaque analizador;
  
  @Before
  public void init() {
    DAbusoDeHabilidad _dAbusoDeHabilidad = new DAbusoDeHabilidad("denuncia1");
    this.d1 = _dAbusoDeHabilidad;
    DAbusoDelSisDeDenuncias _dAbusoDelSisDeDenuncias = new DAbusoDelSisDeDenuncias("denuncia2");
    this.d2 = _dAbusoDelSisDeDenuncias;
    DFeedIntencional _dFeedIntencional = new DFeedIntencional("denuncia3");
    this.d3 = _dFeedIntencional;
    DAbusoDeLenguaje _dAbusoDeLenguaje = new DAbusoDeLenguaje("denuncia4");
    this.d4 = _dAbusoDeLenguaje;
    Jugador _jugador = new Jugador("pepe");
    this.j1 = _jugador;
    Jugador _jugador_1 = new Jugador("pepita");
    this.j2 = _jugador_1;
    Jugador _jugador_2 = new Jugador("jose");
    this.j3 = _jugador_2;
    Personaje _personaje = new Personaje("personaje1");
    this.p1 = _personaje;
    Personaje _personaje_1 = new Personaje("personaje2");
    this.p2 = _personaje_1;
    Personaje _personaje_2 = new Personaje("Personaje3");
    this.p3 = _personaje_2;
    AnalizadorDeAtaque _analizadorDeAtaque = new AnalizadorDeAtaque();
    this.analizador = _analizadorDeAtaque;
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
  public void testPoderDeAtaqueJugador1() {
    int _poderDeAtaque = this.analizador.poderDeAtaque(this.j1, this.p2, "TOP");
    Assert.assertEquals(60, _poderDeAtaque);
  }
  
  @Test
  public void testPoderDeAtaqueJugador2() {
  }
}
