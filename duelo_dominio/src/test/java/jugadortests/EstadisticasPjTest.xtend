package jugadortests


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.Posicion
import jugador.TipoCalificacion
import jugador.EstadisticaDePersonaje

class EstadisticasPjTest {
	
	EstadisticaDePersonaje est
	
	
	 
	 @Before 
	 def void init(){
	 	est= new EstadisticaDePersonaje("SVEN")
	 	
	 }
	 
	 @Test
	 def void testEstadistica() {
	 	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals(Posicion.NONE,est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 	assertEquals(TipoCalificacion.NOOB,est.calificacion)
	 }
	 
	  @Test
	  def void testGanoComoRetador() {
	  	
	  	est.ganoComoRetador(Posicion.TOP)
	  	
	    assertEquals(1,est.duelosIniciados)
	 	assertEquals(1,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals(Posicion.TOP,est.mejorUbicacion)
	 	assertFalse(est.posicionesUsadas.empty)
	
	  	
	  }
	  
	  @Test
	  def void testPerdioComoRetador() {
	  	
	  	est.perdioComoRetador(Posicion.JUNGLE) 
	    
	    assertEquals(1,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals(Posicion.JUNGLE,est.mejorUbicacion)
	 	assertFalse(est.posicionesUsadas.empty)
	
	  		
	  		
	  		
	  	}
	  	
	  @Test
	  def void testGanoComoRival(){
	  	
	  	est.ganoComoRival(Posicion.BOT)
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(1,est.duelosGanados)
	 	assertEquals(1,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals(Posicion.NONE,est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	
	  	
	  	
	  }
	  
	  @Test
	  def void tesPerdioComoRival(){
	  	
	  	est.perdioComoRival(Posicion.MID)
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(1,est.derrotasNoIniciadas)
	 	assertEquals(0,est.duelosEmpatados)
	 	assertEquals(Posicion.NONE,est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)
	 
	  	
	  }
	  	
	  @Test
	  def void testEmpatoComoRetador(){
	  	
	  	est.empatoComoRetador(Posicion.MID)
	  	
	  	assertEquals(1,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(1,est.duelosEmpatados)
	 	assertEquals(Posicion.MID,est.mejorUbicacion)
	 	assertTrue(!est.posicionesUsadas.empty)
	 
	  	
	  	
	  	
	  }
	  
	  @Test
	  def void testEmpatoComoRival(){
	  	
	  		
	  	est.empatoComoRival(Posicion.JUNGLE)
	  	
	  	assertEquals(0,est.duelosIniciados)
	 	assertEquals(0,est.duelosGanados)
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 	assertEquals(1,est.duelosEmpatados)
	 	assertEquals(Posicion.NONE,est.mejorUbicacion)
	 	assertTrue(est.posicionesUsadas.empty)

	  	
	  }
	 
}