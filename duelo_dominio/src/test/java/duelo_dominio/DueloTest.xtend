package duelo_dominio

import jugador.Jugador
import jugador.Duelo
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*

class DueloTest {

	Jugador mockretador
	Duelo duelo
	

    @Before 
	def void init() {

		mockretador = mock(Jugador)
		duelo = new Duelo(mockretador)

	}
 	
	@Test
	def void testElegirPersonajeRetador() {
		assertFalse(false)
	}

}
