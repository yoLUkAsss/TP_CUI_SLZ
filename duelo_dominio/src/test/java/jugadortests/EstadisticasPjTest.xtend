package jugadortests


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.EstadisticasPj

class EstadisticasPjTest {
	
	EstadisticasPj est
	
	
	 
	 @Before 
	 def void init(){
	 	est= new EstadisticasPj("SVEN")
	 	
	 }
	 
	 @Test
	 def void testEstadistica() {
	 	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals("SVEN aun no gano un duelo iniciado... NOOB!!!",est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 	assertEquals(0,est.puntaje())
	 }
	 
	  @Test
	  def void testGanoComoRetador() {
	  	
	  	est.ganoComoRetador("TOP",20)
	  	
	    assertEquals(1,est.duelosIniciados)
	 	assertEquals(1,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals("TOP",est.mejorUbicacion)
	 	assertFalse(est.posicionesUsadas.empty)
	 	assertEquals(20,est.puntaje())
	  	
	  }
	  
	  @Test
	  def void testPerdioComoRetador() {
	  	
	  	est.perdioComoRetador("JUNGLE",40) 
	    
	    assertEquals(1,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals("SVEN aun no gano un duelo iniciado... NOOB!!!",est.mejorUbicacion)
	 	assertFalse(est.posicionesUsadas.empty)
	 	assertEquals(40,est.puntaje())
	  		
	  		
	  		
	  	}
	  	
	  @Test
	  def void testGanoComoRival(){
	  	
	  	est.ganoComoRival("BOT",70)
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(1,est.duelosGanados)
	 	assertEquals(1,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals("SVEN aun no gano un duelo iniciado... NOOB!!!",est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 	assertEquals(0,est.puntaje())
	  	
	  	
	  }
	  
	  @Test
	  def void tesPerdioComoRival(){
	  	
	  	est.perdioComoRival("MID",50)
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(1,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals("SVEN aun no gano un duelo iniciado... NOOB!!!",est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 	assertEquals(0,est.puntaje())
	  	
	  }
	  	
	  @Test
	  def void testEmpato(){
	  	
	  	est.empato()
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(1,est.duelosEmpatados)
	 	assertEquals("SVEN aun no gano un duelo iniciado... NOOB!!!",est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 	assertEquals(0,est.puntaje())
	  	
	  	
	  	
	  }
	 
}