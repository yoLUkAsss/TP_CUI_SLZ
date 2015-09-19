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
		
	}
	
	@Test
	def void testGanadorRetador() {
		
		doReturn(100).when(analizadorSpy).poderDeAtaque(j1,p1,"TOP")
    	doReturn(40).when(analizadorSpy).poderDeAtaque(j2,p2,"JUNGLE")
    	doReturn(1).when(analizadorSpy).factorDeSuerte()
		resultado.actualizarDatos()
		
		assertEquals(retador,resultado.ganador)
		
	}
	
	/* 
	@Test
	def void testGanadorRival() {
		
		
		resultado.actualizarDatos()
		
		assertEquals(rival,resultado.ganador)
		
	}
	*/
	
}