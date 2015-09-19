package denuncias

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*

class DenunciaTest {
	
	
	Denuncia d1 
	Denuncia d2
	Denuncia d3 
	Denuncia d4 
	
	@Before
	def void init() {
		d1 = new DAbusoDeHabilidad("Abusador")
		d2 = new DAbusoDeLenguaje("Mal Hablado")
		d3 = new DFeedIntencional("Feeder")
		d4 = new DAbusoDelSisDeDenuncias("que se yo toy re loco")
	}
	
	@Test
	def void testDePesosDenuncias() {
		assertEquals(10,d3.peso)
		assertEquals(25,d4.peso)
		assertEquals(7,d2.peso)
		assertEquals(5,d1.peso)	
	}
	
	
	
}