package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*;
import appModel.AnalizadorDeAtaque
import jugador.Jugador
import jugador.Personaje

class AnalizadorDeAtaqueTest {
	
	Jugador jugador1
	Jugador jugador2
	Personaje p1
	Personaje p2
	AnalizadorDeAtaque analizador
	AnalizadorDeAtaque analizadorSpy
	

	
	@Before
	def void init(){
		jugador1= new Jugador("pepe")
		jugador2= new Jugador ("jose")
		p1= new Personaje("DIANA","BOT")
		p2= new Personaje("SLARDAR","TOP")
		analizador= new AnalizadorDeAtaque()
	    analizadorSpy= spy(analizador)
		
		
	}
	
	@Test
	
	def void testValorDeCalificacionRAMPAGE(){
		
		jugador1.ganeYSoyRetador(p2,"TOP",100)
		jugador1.ganeYSoyRetador(p2,"MID",500)
		jugador1.ganeYSoyRetador(p2,"TOP",230)
		jugador1.ganeYSoyRetador(p2,"JUNGLE",200)
		jugador1.ganeYSoyRetador(p2,"TOP",150)
		jugador1.ganeYSoyRetador(p2,"TOP",50)
        jugador1.ganeYSoyRetador(p2,"TOP",70)
        jugador1.ganeYSoyRetador(p2,"TOP",70)
        
        
       // doReturn(7).when(analizadorSpy).expPreviaIdealPers(jugador1,p1,"TOP")
        
        doReturn(97).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(100,analizadorSpy.valorDeCalificacion(jugador1,p2,"TOP"))
		
	}
	
	@Test
	def void testValorDeCalificacionDOMINADOR() {
		
		jugador1.ganeYSoyRetador(p1,"BOT",100)
		jugador1.ganeYSoyRetador(p2,"TOP",500)
		jugador1.ganeYSoyRetador(p1,"BOT",230)
		jugador1.ganeYSoyRetador(p2,"BOT",200)
		jugador1.ganeYSoyRetador(p2,"TOP",200)
		jugador1.ganeYSoyRetador(p2,"TOP",150)

		
		
		 
        doReturn(73).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(75,analizadorSpy.valorDeCalificacion(jugador1,p2,"TOP"))
	}
	
	
	@Test
	def void testValorDeCalificacionKILLINGSPREAD() {
		
		
		 doReturn(55).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(60,analizadorSpy.valorDeCalificacion(jugador1,p2,"TOP"))
		
	}
    	
	@Test
	def void testValorDeCalificacionMANCO() {
		
		 jugador2.ganeYSoyRetador(p1,"BOT",150)
		
		 doReturn(40).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(15,analizadorSpy.valorDeCalificacion(jugador2,p1,"BOT"))
	}
    
    @Test
    def void testValorDeCalificacionNOOOB(){
    	
    	jugador2.empate(p2,"MID",200)
    	
    	jugador2.perdiYSoyRival(p2,"TOP",100)
    	
    	doReturn(20).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(5,analizadorSpy.valorDeCalificacion(jugador1,p2,"TOP"))
    	
    	
    	
    }
    
    
    @Test 
    def void testEstadisticasDelPersonaje(){
    	
		jugador2.ganeYSoyRetador(p2,"BOT",230)
		jugador2.empate(p2,"BOT",200)
		jugador2.empate(p2,"MID",200)
		jugador2.perdiYSoyRetador(p2,"TOP",200)
		jugador2.ganeYSoyRival(p2,"TOP",150)
		jugador2.ganeYSoyRival(p2,"TOP",150)
    	jugador2.perdiYSoyRival(p2,"TOP",100)
    	
    
    	
    	//el jugador1 no tiene aun ninguna estadadistica de ese personaje
    	assertEquals(0,analizadorSpy.estadisticasDelPersonaje(jugador1,p1))
        assertEquals(2,analizadorSpy.estadisticasDelPersonaje(jugador2,p2))
        
    
    	
    	
    }
    
    
    @Test
    def void testPoderDeAtaque(){
    	
    	jugador2.ganeYSoyRetador(p2,"TOP",230)
		jugador2.empate(p2,"BOT",200)
		jugador2.empate(p2,"MID",200)
		jugador2.perdiYSoyRetador(p2,"TOP",200)
		jugador2.perdiYSoyRetador(p2,"TOP",100)
		jugador2.ganeYSoyRival(p2,"TOP",150)
		jugador2.ganeYSoyRival(p2,"TOP",150)
    	jugador2.perdiYSoyRival(p2,"TOP",100)
    	
    	
    	doReturn(80).when(analizadorSpy).valorAlAzar()
    	assertEquals(78,analizadorSpy.poderDeAtaque(jugador2,p2,"TOP"))
    	
    	
    	
    }
    
    @Test
    def void testPoderDeAtaqueJugador1(){
    	
    	jugador2.ganeYSoyRetador(p2,"TOP",230)
		
    	
    	
    	doReturn(20).when(analizadorSpy).valorAlAzar()
    	assertEquals(5,analizadorSpy.poderDeAtaque(jugador2,p2,"TOP"))
    	
    	
    }
    
    
    
    
    @Test
    def void testRealizarDuelo() {
    	
    	doReturn(100).when(analizadorSpy).poderDeAtaque(jugador1,p1,"TOP")
    	doReturn(40).when(analizadorSpy).poderDeAtaque(jugador2,p2,"JUNGLE")
    	doReturn(1).when(analizadorSpy).factorDeSuerte()
    	
    	assertEquals(40,analizadorSpy.realizarDuelo(jugador1,jugador2,p1,p2,"TOP","JUNGLE"))
    	
    }
    
   
   
	
	}