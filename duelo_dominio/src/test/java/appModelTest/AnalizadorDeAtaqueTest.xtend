package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*
import appModel.AnalizadorDeAtaque
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import jugador.TipoCalificacion

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
		p1= new Personaje("DIANA",Posicion.BOT)
		p2= new Personaje("SLARDAR",Posicion.TOP)
		analizador= new AnalizadorDeAtaque()
	    analizadorSpy= spy(analizador)
		
		
	}
	
	@Test
	
	def void testValorDeCalificacionRAMPAGE(){
		
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)
		jugador1.ganeYSoyRetador(p2,Posicion.MID)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)
		jugador1.ganeYSoyRetador(p2,Posicion.JUNGLE)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP) 
        jugador1.ganeYSoyRetador(p2,Posicion.TOP)
        jugador1.ganeYSoyRetador(p2,Posicion.TOP)
                
        doReturn(97).when(analizadorSpy).valorAlAzar()
        
	    
	    assertEquals(100,analizadorSpy.valorDeCalificacion(jugador1,p2,Posicion.TOP))
		
	}
	
	@Test
	def void testValorDeCalificacionDOMINADOR() {
		
		jugador1.ganeYSoyRetador(p1,Posicion.BOT)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)
		jugador1.ganeYSoyRetador(p1,Posicion.BOT)
		jugador1.ganeYSoyRetador(p2,Posicion.BOT)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)
		jugador1.ganeYSoyRetador(p2,Posicion.TOP)

		
		
		 
        doReturn(73).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(75,analizadorSpy.valorDeCalificacion(jugador1,p2,Posicion.TOP))
	}
	
	
	@Test
	def void testValorDeCalificacionKILLINGSPREAD() {
		
		
		 doReturn(55).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(60,analizadorSpy.valorDeCalificacion(jugador1,p2,Posicion.TOP))
		
	}
    	
	@Test
	def void testValorDeCalificacionMANCO() {
		
		 jugador2.ganeYSoyRetador(p1,Posicion.BOT)
		
		 doReturn(40).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(15,analizadorSpy.valorDeCalificacion(jugador2,p1,Posicion.BOT))
	}
    
    @Test
    def void testValorDeCalificacionNOOOB(){
    	
    	
    	doReturn(5).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(5,analizadorSpy.valorDeCalificacion(jugador1,p2,Posicion.TOP))
    	
    	
    	
    }
    
    
    @Test 
    def void testEstadisticasDelPersonaje(){
    	
		jugador2.ganeYSoyRetador(p2,Posicion.BOT)
		jugador2.empateComoRetador(p2,Posicion.BOT)
		jugador2.empateComoRival(p2,Posicion.MID)
		jugador2.perdiYSoyRetador(p2,Posicion.TOP)
		jugador2.ganeYSoyRival(p2,Posicion.TOP)
		jugador2.ganeYSoyRival(p2,Posicion.TOP)
    	jugador2.perdiYSoyRival(p2,Posicion.TOP)
    	
    
    	
    	//el jugador1 no tiene aun ninguna estadadistica de ese personaje
    	assertEquals(0,analizadorSpy.valorDeEstadisticasDelJugador(jugador1,p1))
        assertEquals(3,analizadorSpy.valorDeEstadisticasDelJugador(jugador2,p2))
        
    
    	
    	
    }
    
    
    @Test
    def void testPoderDeAtaque(){
    	
    	jugador2.ganeYSoyRetador(p2,Posicion.TOP)
		jugador2.empateComoRetador(p2,Posicion.BOT)
		jugador2.empateComoRival(p2,Posicion.MID)
		jugador2.perdiYSoyRetador(p2,Posicion.BOT)
		jugador2.perdiYSoyRetador(p2,Posicion.TOP)
		jugador2.ganeYSoyRival(p2,Posicion.TOP)
		jugador2.ganeYSoyRival(p2,Posicion.TOP)
    	jugador2.perdiYSoyRival(p2,Posicion.TOP)
    	
    	
    	doReturn(80).when(analizadorSpy).valorAlAzar()
    	assertEquals(64,analizadorSpy.poderDeAtaque(jugador2,p2,Posicion.TOP))
    	
    	
    	
    }
    
    @Test
    def void testPoderDeAtaqueJugador1(){
    	
    	jugador2.ganeYSoyRetador(p2,Posicion.TOP)
		
    	
    	
    	doReturn(20).when(analizadorSpy).valorAlAzar()
    	assertEquals(5,analizadorSpy.poderDeAtaque(jugador2,p2,Posicion.TOP))
    	
    	
    }
    
    
    
    
    
   
   
	
	}