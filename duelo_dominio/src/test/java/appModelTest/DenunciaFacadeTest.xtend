package appModelTest

import appModel.DenunciaFacade
import denuncias.DAbusoDeLenguaje
import denuncias.DFeedIntencional
import denuncias.Denuncia
import jugador.Jugador
import org.junit.Before
import org.junit.Test
import org.uqbar.commons.model.UserException

import static org.junit.Assert.*

class DenunciaFacadeTest {
	
	Jugador from
	Jugador to 
	Denuncia denuncia
	
	DenunciaFacade facade
	
	@Before
	def void init() {
		from = new Jugador("El dipi papa")
		to = new Jugador ("Daddy Yankee")
		facade = new DenunciaFacade(from,to)
		denuncia = new DAbusoDeLenguaje("Este pibe es muy malo")
	}
	
	@Test
	def void testDenunciaValida() {
		facade.denuncia = denuncia
		
		facade.hacerDenuncia
		
		assertEquals(0,from.denuncias.size)
		assertEquals(1,to.denuncias.size)
	}
	
	@Test (expected = UserException) 
	def void testDenunciaNoCargada() {
		facade.hacerDenuncia
	}
	
	@Test
	def void testDenunciaInvalida() {
		facade.denuncia = new DFeedIntencional("no valgo")
		facade.hacerDenuncia
		
		assertEquals(1,from.denuncias.size)
		assertEquals(0,to.denuncias.size)
	}
	
}