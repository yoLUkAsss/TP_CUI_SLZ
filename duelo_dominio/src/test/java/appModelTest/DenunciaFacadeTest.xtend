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
	Denuncia den1
	
	DenunciaFacade df
	
	@Before
	def void init() {
		from = new Jugador("El dipi papa")
		to = new Jugador ("Daddy Yankee")
		df = new DenunciaFacade(from,to)
		den1 = new DAbusoDeLenguaje("Este pibe es muy malo")
	}
	
	@Test
	def void testDenunciaValida() {
		df.denuncia = den1
		
		df.hacerDenuncia
		
		assertEquals(0,from.denuncias.size)
		assertEquals(1,to.denuncias.size)
	}
	
	@Test (expected = UserException) 
	def void testDenunciaNoCargada() {
		df.hacerDenuncia
	}
	
	@Test
	def void testDenunciaInvalida() {
		df.denuncia = new DFeedIntencional("no valgo")
		df.hacerDenuncia
		
		assertEquals(1,from.denuncias.size)
		assertEquals(0,to.denuncias.size)
	}
	
}