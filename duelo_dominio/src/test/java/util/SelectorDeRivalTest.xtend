package util

import jugador.Jugador
import jugador.Personaje
import java.util.List
import jugador.Posicion
import org.junit.Test
import org.junit.Before
import static org.junit.Assert.*

class SelectorDeRivalTest {
	
	
	SelectorDeRival SUT
	List<Jugador> listaDeJugadores
	List<Personaje> listaDePersonajes
	Jugador jugador1; Jugador jugador2; Jugador jugador3
	Personaje personaje1; Personaje personaje2; Personaje personaje3; Personaje personaje4
	
	@Before
	def void init() {
		listaDeJugadores = newArrayList
		listaDePersonajes = newArrayList
		jugador1 = new Jugador("Lucas")
		jugador2 = new Jugador("Rosali")
		jugador3 = new Jugador("Nicolas")
		
		listaDeJugadores.add(jugador1)
		listaDeJugadores.add(jugador2)
		listaDeJugadores.add(jugador3)
		
		personaje1 = new Personaje("Amumu",Posicion.TOP)
		personaje2 = new Personaje("Viper",Posicion.MID)
		personaje3 = new Personaje("Ahri",Posicion.JUNGLE)
		personaje4 = new Personaje("Pudge",Posicion.BOT)
		
		listaDePersonajes.add(personaje1)
		listaDePersonajes.add(personaje2)
		listaDePersonajes.add(personaje3)
		listaDePersonajes.add(personaje4)
		
		SUT = new SelectorDeRival(listaDePersonajes,listaDeJugadores)
	}
	
	@Test
	def void test_cuando_le_doy_un_retador_me_retorna_un_jugador_distinto_del_retador() {
		//Preparamos un retador con el jugador 1
		var auxiliar = new DetalleJugadorDuelo(jugador1,personaje1,Posicion.TOP)
		
		//Definimos quien es el rival
		var rival = SUT.dameRival(auxiliar)
		
		//Verificamos que el jugador rival es diferente del jugador 1
		assertNotEquals(jugador1,rival.jugador)
	}
	
	@Test
	def void test_cuando_recibe_un_personaje_me_retorna_un_personaje_distinto_del_que_recibio() {
		//Preparamos un persoanej con el personaje 3
		var auxiliar = personaje3
		
		//Definimos quien es el rival
		var otroPersonaje = SUT.determinarPersonaje(auxiliar)
		
		//Verificamos que el jugador rival es diferente del jugador 1
		assertNotEquals(personaje3,otroPersonaje)
	}
	
	@Test
	def void test_cuando_recibe_valores_con_diferencia_menor_o_igual_a_100_retorna_true(){
		//Preparamos 2 valores de calificaciones posibles
		var calificacion1 = 156
		var calificacion2 = 212
		
		//Verificamos su validez
		assertTrue(SUT.puedeJugar(calificacion1,calificacion2))
	}
	
	@Test
	def void test_cuando_recibe_valores_con_diferencia_mayor_a_100_retorna_false(){
		//Preparamos 2 valores de calificaciones posibles
		var calificacion1 = 100
		var calificacion2 = 201
		
		//Verificamos su validez
		assertFalse(SUT.puedeJugar(calificacion1,calificacion2))
	}
	
	@Test
	def void test_cuando_agrego_un_nuevo_personaje_se_agrega_bien() {
		//Preparamos un nuevo personaje
		var nuevoPersonaje = new Personaje("Teffi",Posicion.JUNGLE)
		
		//Agregamos dicho personaje
		SUT.agregarPersonaje(nuevoPersonaje)
		
		//Verificamos que se encuentre dentro
		assertTrue(SUT.contieneEstePersonaje(nuevoPersonaje))
	}
	
	@Test
	def void test_cuando_agrego_un_nuevo_jugador_se_agrega_bien() {
		//Preparamos un nuevo jugador
		var nuevoJugador = new Jugador("Gise")
		
		//Agregamos dicho jugador
		SUT.agregarJugador(nuevoJugador)
		
		//Verificamos que se encuentre dentro
		assertTrue(SUT.contieneEsteJugador(nuevoJugador))
	}
}