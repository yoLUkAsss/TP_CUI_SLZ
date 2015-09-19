package appModelTest

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*;
import appModel.ResultadoDueloAppModel
import jugador.Jugador
import appModel.DetalleJugadorDueloAppModel
import jugador.Personaje
import appModel.AnalizadorDeAtaque

class ResultadoDueloAppModelTest {
	
	ResultadoDueloAppModel resultado
    ResultadoDueloAppModel resultadoSpy
	
    DetalleJugadorDueloAppModel retador
	DetalleJugadorDueloAppModel rival
	AnalizadorDeAtaque analizador
	AnalizadorDeAtaque analizadorSpy
	Jugador j1
	Jugador j2 
	
	Personaje p1
	Personaje p2 
	
	
	
	@Before
	def void init(){
		j1= new Jugador("pepe")
		j2= new Jugador("azul")
		p1= new Personaje("WEAVER","TOP")
		p2= new Personaje("FIORA","JUNGLE")
		retador= new DetalleJugadorDueloAppModel(j1,p1,"TOP")
		rival= new DetalleJugadorDueloAppModel(j2,p2,"MID")
		analizador= new AnalizadorDeAtaque()
		analizadorSpy= spy(analizador) 
		resultado= new ResultadoDueloAppModel(retador,rival)
		resultadoSpy= spy(resultado)
		
		
		
	   
		
		
		
	}
	
	@Test
	def void testGanadorRival() {
		
	    
          j1.ganeYSoyRetador(p1,"TOP",100)
          j1.empate(p1,"TOP",100)
        
          j2.ganeYSoyRetador(p2,"TOP",100)
          j2.empate(p2,"TOP",100)
          j2.ganeYSoyRetador(p2,"TOP",100)
          j2.empate(p2,"TOP",100)
          
          doReturn(1).when(analizadorSpy).valorAlAzar()
          doReturn(1).when(analizadorSpy).factorDeSuerte()
      
         resultado.actualizarDatos()
        
         assertEquals(j2,resultado.ganador)
         assertEquals(j1,resultado.perdedor)
        
     
      }
	
	
		


    @Test
	 def void testGanadorRetador() {
		
	    
          j2.ganeYSoyRetador(p1,"TOP",100)
          j2.empate(p1,"TOP",100)
        
          j1.ganeYSoyRetador(p2,"TOP",100)
          j1.empate(p2,"TOP",100)
          j1.ganeYSoyRetador(p2,"TOP",100)
          j1.empate(p2,"TOP",100)
          
          doReturn(1).when(analizadorSpy).valorAlAzar()
          doReturn(1).when(analizadorSpy).factorDeSuerte()
      
         resultado.actualizarDatos()
        
         assertEquals(j1,resultado.ganador)
         assertEquals(j2,resultado.perdedor)
        
     
      }


}