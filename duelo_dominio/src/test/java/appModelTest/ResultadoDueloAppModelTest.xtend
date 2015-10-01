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

class ResultadoDueloAppModelTest {
    
    
    DetalleJugadorDuelo retador
    DetalleJugadorDuelo rival       
    Jugador j1
	Jugador j2
	Personaje p1
	Personaje p2
    ResultadoDueloAppModel resultado  
    ResultadoDueloAppModel resultadoSpy 	
    
    
    
    
    @Before
    def void init(){
    	
    	j1=new Jugador("juan")
    	j2=new Jugador("maria")
    	p1=new Personaje("Silencer",Posicion.JUNGLE)
    	p2=new Personaje("FIZZ",Posicion.TOP)
    	retador= new DetalleJugadorDuelo(j1,p1,Posicion.JUNGLE)
    	rival=new DetalleJugadorDuelo(j2,p2,Posicion.TOP)
    	
    	resultado= new ResultadoDueloAppModel(retador,rival)
    	resultadoSpy= spy(resultado)
    	
    }
    
    
    @Test
    def void testDueloEmpatado(){
    	
        var s =new ArrayList<Integer> 
		s.add(100)
		s.add(100)
		doReturn(s).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		assertTrue(resultadoSpy.empate)
    	
    }
    
    @Test
    def void testDueloGanadorRetador(){
    	
    	var s =new ArrayList<Integer> 
		s.add(100)
		s.add(60)
		doReturn(s).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		
		assertEquals(j1,resultadoSpy.ganador)
		assertEquals(j2,resultadoSpy.perdedor)
    }
  
    @Test
    def void testDueloGanadorRival(){
    	
    	var s =new ArrayList<Integer> 
		s.add(100)
		s.add(200)
		doReturn(s).when(resultadoSpy).resultadoDuelo()
		resultadoSpy.actualizarDatos()
		
		assertEquals(j2,resultadoSpy.ganador)
    	assertEquals(j1,resultadoSpy.perdedor)
    	
    }
   
}