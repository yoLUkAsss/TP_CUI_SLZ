package appModelTests

import jugador.Jugador
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*
import jugador.Personaje
import appModel.Duelo

class DueloTest {

	Jugador retador
    Jugador j1
    Jugador j2 
    Jugador j3
    Personaje p1
    Personaje p2 
    Personaje p3
    
	Duelo duelo
	

    @Before 
	def void init() {

		retador = mock(Jugador)
		j1= mock(Jugador)
		j2= mock(Jugador)
		j3= mock(Jugador)
		p1=mock(Personaje)
		p2=mock(Personaje)
		p3=mock(Personaje)
		duelo= new Duelo(retador)
		//jugadores
        duelo.jugadores.add(j1)
        duelo.jugadores.add(j2)
        duelo.jugadores.add(j3)
        //personajes
        duelo.personajes.add(p1)
        duelo.personajes.add(p2)
        duelo.personajes.add(p3)
	}
 	
	@Test
	def void test() {
		 
	         assertTrue(true)
		
    }
}


