package appModelTest

import util.DetalleJugadorDuelo
import appModel.ResultadoDueloAppModel
import java.util.ArrayList
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*
import util.ResultadoDuelo

class ResultadoDueloAppModelTest {
    
    
    DetalleJugadorDuelo retador
    DetalleJugadorDuelo rival       
    Jugador jugadorNumero1
	Jugador jugadorNumero2
	Personaje personaje1
	Personaje personaje2
    ResultadoDueloAppModel resultado  
    ResultadoDueloAppModel resultadoSpy 	
    
    
    
    
    @Before
    def void init(){
    	
    	jugadorNumero1=new Jugador("juan")
    	jugadorNumero2=new Jugador("maria")
    	personaje1=new Personaje("Silencer",Posicion.JUNGLE)
    	personaje2=new Personaje("FIZZ",Posicion.TOP)
    	retador= new DetalleJugadorDuelo(jugadorNumero1,personaje1,Posicion.JUNGLE)
    	rival=new DetalleJugadorDuelo(jugadorNumero2,personaje2,Posicion.TOP)
    	
    	resultado= new ResultadoDueloAppModel(retador,rival)
    	resultadoSpy= spy(resultado)
    	
    }
    
    
    @Test
    def void testDueloEmpatado(){	
        var nuevoResultado = new ResultadoDuelo(jugadorNumero1,45,jugadorNumero2,45)
		doReturn(nuevoResultado).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		
		assertTrue(resultadoSpy.empate)	
    }
    
    @Test
    def void testDueloGanadorRetador(){
    	
    	var nuevoResultado = new ResultadoDuelo(jugadorNumero1,100,jugadorNumero2,45)
		doReturn(nuevoResultado).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		
		assertEquals(jugadorNumero1,resultadoSpy.ganador)
    }
  
    @Test
    def void testDueloGanadorRival(){
    	var nuevoResultado = new ResultadoDuelo(jugadorNumero1,100,jugadorNumero2,156)
		doReturn(nuevoResultado).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		
		assertEquals(jugadorNumero2,resultadoSpy.ganador)  	
    }
   
}