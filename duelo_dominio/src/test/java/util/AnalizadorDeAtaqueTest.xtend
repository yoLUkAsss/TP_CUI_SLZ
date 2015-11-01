package util


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*
import util.AnalizadorDeAtaque
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import jugador.TipoCalificacion


class AnalizadorDeAtaqueTest {
	
	Jugador jugador1
	Jugador jugador2
	Personaje personaje1
	Personaje personaje2
	AnalizadorDeAtaque analizador
	AnalizadorDeAtaque analizadorSpy
	

	
	@Before
	def void init(){
		jugador1= new Jugador("pepe")
		jugador2= new Jugador ("jose")
		personaje1= new Personaje("DIANA",Posicion.BOT)
		personaje2= new Personaje("SLARDAR",Posicion.TOP)
		analizador= new AnalizadorDeAtaque()
	    analizadorSpy= spy(analizador)
		
		
	}
	
	@Test
	
	def void test_obtengo_valor_de_calificacion_rampage(){	
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador1.ganeYSoyRetador(personaje2,Posicion.MID)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador1.ganeYSoyRetador(personaje2,Posicion.JUNGLE)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP) 
        jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
        jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
                
        doReturn(97).when(analizadorSpy).valorAlAzar()
           
	    assertEquals(100,analizadorSpy.valorDeCalificacion(jugador1,personaje2,Posicion.TOP))
	}
	
	@Test
	def void test_obtengo_valor_de_calificacion_dominador() {
		jugador1.ganeYSoyRetador(personaje1,Posicion.BOT)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador1.ganeYSoyRetador(personaje1,Posicion.BOT)
		jugador1.ganeYSoyRetador(personaje2,Posicion.BOT)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador1.ganeYSoyRetador(personaje2,Posicion.TOP)

        doReturn(73).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(75,analizadorSpy.valorDeCalificacion(jugador1,personaje2,Posicion.TOP))
	}
	
	
	@Test
	def void test_obtengo_valor_de_calificacion_killing_spread() {
		doReturn(55).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(60,analizadorSpy.valorDeCalificacion(jugador1,personaje2,Posicion.TOP))
	}
    	
	@Test
	def void test_obtengo_valor_de_calificacion_manco() {
		jugador2.ganeYSoyRetador(personaje1,Posicion.BOT)
		
		doReturn(40).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(15,analizadorSpy.valorDeCalificacion(jugador2,personaje1,Posicion.BOT))
	}
    
    @Test
    def void test_obtengo_valor_de_calificacion_noob(){
    	doReturn(5).when(analizadorSpy).valorAlAzar()
	    
	    assertEquals(5,analizadorSpy.valorDeCalificacion(jugador1,personaje2,Posicion.TOP))
    }
    
    
    @Test 
    def void test_valor_de_estadisticas_luego_de_varios_encuentros_es_3(){
		jugador2.ganeYSoyRetador(personaje2,Posicion.BOT)
		jugador2.empateComoRetador(personaje2,Posicion.BOT)
		jugador2.empateComoRival(personaje2,Posicion.MID)
		jugador2.perdiYSoyRetador(personaje2,Posicion.TOP)
		jugador2.ganeYSoyRival(personaje2,Posicion.TOP)
		jugador2.ganeYSoyRival(personaje2,Posicion.TOP)
    	jugador2.perdiYSoyRival(personaje2,Posicion.TOP)
    	
        assertEquals(3,analizadorSpy.valorDeEstadisticasDelJugador(jugador2,personaje2))
    }
    
    def void test_valor_de_estadisticas_sin_jugar_un_solo_juego_es_0() {
    	assertEquals(0,analizadorSpy.valorDeEstadisticasDelJugador(jugador1,personaje1))
    }
    
    @Test
    def void test_con_valor_al_azar_84_y_estos_encuentros_obtengo_poder_de_ataque_64(){   	
    	jugador2.ganeYSoyRetador(personaje2,Posicion.TOP)
		jugador2.empateComoRetador(personaje2,Posicion.BOT)
		jugador2.empateComoRival(personaje2,Posicion.MID)
		jugador2.perdiYSoyRetador(personaje2,Posicion.BOT)
		jugador2.perdiYSoyRetador(personaje2,Posicion.TOP)
		jugador2.ganeYSoyRival(personaje2,Posicion.TOP)
		jugador2.ganeYSoyRival(personaje2,Posicion.TOP)
    	jugador2.perdiYSoyRival(personaje2,Posicion.TOP)
    	
    	doReturn(80).when(analizadorSpy).valorAlAzar()
    	
    	assertEquals(64,analizadorSpy.poderDeAtaque(jugador2,personaje2,Posicion.TOP))
    }
    
    @Test
    def void test_con_valor_al_azar_20_y_estos_encuentros_obtengo_poder_de_ataque_5(){
    	jugador2.ganeYSoyRetador(personaje2,Posicion.TOP)
		
    	doReturn(20).when(analizadorSpy).valorAlAzar()
    	
    	assertEquals(5,analizadorSpy.poderDeAtaque(jugador2,personaje2,Posicion.TOP))
    }
    
    
    
    
    
   
   
	
	}