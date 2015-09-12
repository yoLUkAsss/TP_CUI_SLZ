package jugadortests

import jugador.Jugador

import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test
import denuncias.*
import jugador.EstadisticasPj
import jugador.Personaje

class JugadorTest {
	
	 Jugador jugador
	 DAbusoDeHabilidad denuncia1
	 DFeedIntencional denuncia2
	 DAbusoDeLenguaje denuncia3
	 Personaje personaje
	 Personaje personaje1
	 
	 
	 @Before 
	 def void init(){
	 	
	 	personaje= new Personaje("personaje")
	 	denuncia1= new DAbusoDeHabilidad("denunci1")
	 	denuncia2= new DFeedIntencional("dencia2")
	 	denuncia3= new DAbusoDeLenguaje("denunci3")
	 //	pj1= new EstadisticasPj("personaje1")
	 //	pj2= new EstadisticasPj("personaje2")
	    personaje1=new Personaje("personaje3")
	 	personaje= new Personaje("personaje1")
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