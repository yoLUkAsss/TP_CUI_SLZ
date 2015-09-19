package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import appModel.Duelo
import appModel.SelectorDeRivalAppModel
import jugador.Jugador
import excepciones.NoHayRivalException
import jugador.Posicion

class DueloTest {
	
	
	Duelo duelo
	Jugador jugador
	
	@Before 
	def void init(){
		jugador= new Jugador("pepe")
		duelo= new Duelo(jugador)
		
	}
	
	@Test(expected=NoHayRivalException)
	
	def void testNoHayRival() throws NoHayRivalException{
		
		duelo.iniciarDuelo(Posicion.TOP)
		
	}
	
	
}