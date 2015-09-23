package jugadortests



import jugador.Jugador
import denuncias.DAbusoDeHabilidad
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje
import jugador.Personaje
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.Posicion

class JugadorTest {
	
	
	 Jugador jugador
	 DAbusoDeHabilidad denuncia1
	 DFeedIntencional denuncia2
	 DAbusoDeLenguaje denuncia3
	 Personaje personaje1
	 Personaje personaje2
	 Personaje personaje3 
	
	@Before
	def void init() {
		
		
	 	denuncia1= new DAbusoDeHabilidad("denunci1")
	 	denuncia2= new DFeedIntencional("dencia2")
	 	denuncia3= new DAbusoDeLenguaje("denunci3")
	 	personaje1= new Personaje("AHRI",Posicion.MID)
	    personaje2=new Personaje("ALISTAR",Posicion.TOP)
	 	personaje3= new Personaje("AMUMU",Posicion.JUNGLE)
	 	jugador= new Jugador("pepe")
		
	}
	
    
    @Test
    
	def void testDevolverValorDeRanking() {
	 	
	 	jugador.addDenuncia(denuncia1)
	 	jugador.addDenuncia(denuncia2)
	 	jugador.addDenuncia(denuncia3)
	 	jugador.empateComoRetador(personaje1,Posicion.TOP)
	 	jugador.ganeYSoyRetador(personaje1,Posicion.TOP)
	 	
	 	var expected = 22
	 	
	 	assertEquals(expected,jugador.ranking())
	 	
	 	
	 }
	 
	 
	 @Test
	 def void testTieneUnaSolaEstadisticasDelPersonaje(){
	 	jugador.ganeYSoyRetador(personaje2,Posicion.TOP)
	 	jugador.perdiYSoyRetador(personaje2,Posicion.JUNGLE)
	 	
	 	assertTrue(jugador.est.size==1)
	 }
	 
	 
	  @Test
	   def void testEstadisticas(){
	 	jugador.ganeYSoyRetador(personaje2,Posicion.TOP)
	 	jugador.perdiYSoyRetador(personaje2,Posicion.JUNGLE)
	 	jugador.empateComoRival(personaje1,Posicion.MID)
	 	
	 	assertTrue(jugador.est.size==2)
	 }
	 
	@Test
	def void testEstadisticasVarias(){
	 	jugador.ganeYSoyRetador(personaje2,Posicion.TOP)
	 	jugador.perdiYSoyRetador(personaje2,Posicion.JUNGLE)
	 	jugador.empateComoRetador(personaje1,Posicion.MID)
	 	jugador.ganeYSoyRival(personaje2,Posicion.TOP)
	 	jugador.perdiYSoyRetador(personaje2,Posicion.JUNGLE)
	 	jugador.empateComoRival(personaje1,Posicion.MID)
	 	jugador.ganeYSoyRetador(personaje3,Posicion.TOP)
	 	jugador.perdiYSoyRival(personaje3,Posicion.JUNGLE)
	 	jugador.empateComoRetador(personaje3,Posicion.MID)
	 	
	 	assertTrue(jugador.est.size==3)
	}
	 
	 
	
	 
	
}