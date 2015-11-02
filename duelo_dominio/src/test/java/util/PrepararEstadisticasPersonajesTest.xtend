package util

import org.junit.Before
import org.junit.Test
import jugador.Jugador
import jugador.Personaje
import jugador.Posicion
import java.util.List
import static org.junit.Assert.*

class PrepararEstadisticasDePersonajesTest {
	
	
	
	PrepararEstadisticasPersonajes SUT
	Jugador jugadorActual
	List<Personaje> listaDePersonajes = newArrayList
	Personaje personaje1 
	Personaje personaje2 
	Personaje personaje3 
	Personaje personaje4 
	
	@Before
	def void init() {
		jugadorActual = new Jugador("JUnit")
		
		personaje1 = new Personaje("Amumu",Posicion.TOP)
		personaje2 = new Personaje("Viper",Posicion.MID)
		personaje3 = new Personaje("Ahri",Posicion.JUNGLE)
		personaje4 = new Personaje("Pudge",Posicion.BOT)
		
		listaDePersonajes.add(personaje1)
		listaDePersonajes.add(personaje2)
		listaDePersonajes.add(personaje3)
		listaDePersonajes.add(personaje4)
		
		SUT = new PrepararEstadisticasPersonajes(jugadorActual,listaDePersonajes)
	}
	
	@Test
	def void test_verificacion_de_pedido_de_estadisticas() {
		//Preparamos que el jugador actual ya tiene toda una estadistica con el personaje 1
		//Y ninguna estadistica con el resto de los personajes
		//y luego la obtenemos
		jugadorActual.ganeYSoyRetador(personaje1,Posicion.TOP)
		jugadorActual.ganeYSoyRetador(personaje1,Posicion.TOP)
		jugadorActual.ganeYSoyRetador(personaje1,Posicion.TOP)
		var estadistica = jugadorActual.estadisticaDelPersonaje(personaje1)
		
		//Obtenemos la estadisticas a mostrar
		var resultado = SUT.estadisticasPreparadas()
		
		//Verificamos que la estadistica marcada, se encuentra en el resultado
		assertTrue(resultado.contains(estadistica))
	}
}