package jugadortests

import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDeLenguaje
import denuncias.DFeedIntencional
import jugador.Jugador
import jugador.Personaje
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class JugadorTest {
	
	 Jugador jugador
	 DAbusoDeHabilidad denuncia1
	 DFeedIntencional denuncia2
	 DAbusoDeLenguaje denuncia3
	 Personaje personaje
	 Personaje personaje1
	 
	 
	 @Before 
	 def void init(){  
	 	
	 	personaje= new Personaje("personaje","mid")
	 	denuncia1= new DAbusoDeHabilidad("denunci1")
	 	denuncia2= new DFeedIntencional("dencia2")
	 	denuncia3= new DAbusoDeLenguaje("denunci3")
	    personaje1=new Personaje("personaje3","top")
	 	personaje= new Personaje("personaje1","top")
	 	jugador= new Jugador("pepita")
	 	
	 } 
	 
	 @Test
	 def void testSinRanking(){
	 	
	 	assertTrue(0==jugador.ranking())
	 }


	 
	 @Test
	 def void testRankingIgualA100(){
	 	
	 	jugador.addDenuncia(denuncia1)
	 	jugador.addDenuncia(denuncia2)
	 	jugador.addDenuncia(denuncia3)
	 	jugador.empate(personaje1,"TOP",70)
	 	jugador.ganeYSoyRetador(personaje,"TOP",67)
	 	
	 	var expected = 22
	 	
	 	assertEquals(expected,jugador.ranking())
	 	
	 	
	 }

     @Test
     def void testNoTieneEstadisticasCargadas(){
     	
       assertTrue(jugador.est.size==0)
     	
     }	 
	 
	 @Test
	 def void testTieneUnaSolaEstadisticasDelPersonaje(){
	 	jugador.ganeYSoyRetador(personaje,"TOP",100)
	 	jugador.perdiYSoyRetador(personaje,"JUNGLE",200)
	 	
	 	assertTrue(jugador.est.size==1)
	 }
	 
	 
	
}