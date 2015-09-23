package jugadortests

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.MRX
import jugador.Jugador
import denuncias.DAbusoDeHabilidad
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje
import jugador.Personaje
import jugador.Posicion

class MRXTest {
	
	MRX robot
	Jugador jugador
	DAbusoDeHabilidad denuncia1
	DFeedIntencional denuncia2
	DAbusoDeLenguaje denuncia3
	Personaje personaje1
	Personaje personaje2
	Personaje personaje3 
	
	@Before 
	def void init(){
		
	    denuncia1= new DAbusoDeHabilidad("denunci1")
	 	denuncia2= new DFeedIntencional("dencia2")
	 	denuncia3= new DAbusoDeLenguaje("denunci3")
	 	personaje1= new Personaje("AHRI",Posicion.MID)
	    personaje2=new Personaje("ALISTAR",Posicion.TOP)
	 	personaje3= new Personaje("AMUMU",Posicion.JUNGLE)
	 	jugador= new Jugador("pepe")
		robot= new MRX("MR-X",jugador)
		
		jugador.addDenuncia(denuncia1)
	 	jugador.addDenuncia(denuncia2)
	 	jugador.addDenuncia(denuncia3)
	 	jugador.empateComoRival(personaje1,Posicion.TOP)
	 	jugador.ganeYSoyRetador(personaje1,Posicion.TOP)
	 
	 	
	}
	
	@Test
	def void testNombre(){
		assertEquals("MR-X",robot.getNombre())
	}
	
	 @Test
	 def void testRankingRobot(){
	 	
	 	assertEquals(22,jugador.ranking())
	 	assertEquals(22,robot.ranking())
	 	
	 }
	
}