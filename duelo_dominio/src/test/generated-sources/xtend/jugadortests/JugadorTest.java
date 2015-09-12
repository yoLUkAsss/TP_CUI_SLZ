package jugadortests;

import denuncias.DAbusoDeHabilidad;
import denuncias.DAbusoDeLenguaje;
import denuncias.DFeedIntencional;
import java.util.Collection;
import jugador.EstadisticasPj;
import jugador.Jugador;
import jugador.Personaje;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class JugadorTest {
  private Jugador jugador;
  
  private DAbusoDeHabilidad denuncia1;
  
  private DFeedIntencional denuncia2;
  
  private DAbusoDeLenguaje denuncia3;
  
  private Personaje personaje;
  
  private Personaje personaje1;
  
  @Before
  public void init() {
    Personaje _personaje = new Personaje("personaje");
    this.personaje = _personaje;
    DAbusoDeHabilidad _dAbusoDeHabilidad = new DAbusoDeHabilidad("denunci1");
    this.denuncia1 = _dAbusoDeHabilidad;
    DFeedIntencional _dFeedIntencional = new DFeedIntencional("dencia2");
    this.denuncia2 = _dFeedIntencional;
    DAbusoDeLenguaje _dAbusoDeLenguaje = new DAbusoDeLenguaje("denunci3");
    this.denuncia3 = _dAbusoDeLenguaje;
    Personaje _personaje_1 = new Personaje("personaje3");
    this.personaje1 = _personaje_1;
    Personaje _personaje_2 = new Personaje("personaje1");
    this.personaje = _personaje_2;
    Jugador _jugador = new Jugador("pepita");
    this.jugador = _jugador;
  }
  
  @Test
  public void testSinRanking() {
    int _ranking = this.jugador.ranking();
    boolean _equals = (0 == _ranking);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testRankingIgualA100() {
    this.jugador.addDenuncia(this.denuncia1);
    this.jugador.addDenuncia(this.denuncia2);
    this.jugador.addDenuncia(this.denuncia3);
    this.jugador.empate(this.personaje1, "TOP", Integer.valueOf(70));
    this.jugador.ganeYSoyRetador(this.personaje, "TOP", Integer.valueOf(67));
    int expected = 22;
    int _ranking = this.jugador.ranking();
    Assert.assertEquals(expected, _ranking);
  }
  
  @Test
  public void testNoTieneEstadisticasCargadas() {
    Collection<EstadisticasPj> _est = this.jugador.getEst();
    int _size = _est.size();
    boolean _equals = (_size == 0);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void testTieneUnaSolaEstadisticasDelPersonaje() {
    this.jugador.ganeYSoyRetador(this.personaje, "TOP", Integer.valueOf(100));
    this.jugador.perdiYSoyRetador(this.personaje, "JUNGLE", Integer.valueOf(200));
    Collection<EstadisticasPj> _est = this.jugador.getEst();
    int _size = _est.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
}
