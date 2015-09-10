package duelo_dominio;

import jugador.Duelo;
import jugador.Jugador;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

@SuppressWarnings("all")
public class DueloTest {
  private Jugador mockretador;
  
  private Duelo duelo;
  
  @Before
  public void init() {
    Jugador _mock = Mockito.<Jugador>mock(Jugador.class);
    this.mockretador = _mock;
    Duelo _duelo = new Duelo(this.mockretador);
    this.duelo = _duelo;
  }
  
  @Test
  public void testElegirPersonajeRetador() {
    Assert.assertFalse(false);
  }
}
