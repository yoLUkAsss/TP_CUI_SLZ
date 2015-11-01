package util

import static org.junit.Assert.*
import org.junit.Before
import jugador.Jugador
import org.junit.Test

class ResultadoDueloTest {
	
	
	ResultadoDuelo SUT
	Jugador retador; Jugador rival
	Integer calificacionRetador; Integer calificacionRival
	
	@Before
	def void init() {
		retador = new Jugador("Lucas")
		rival = new Jugador("Rosali")
		calificacionRetador = 156
		calificacionRival = 185
		
		SUT = new ResultadoDuelo(retador,calificacionRetador,rival,calificacionRival)
	}
	
	@Test
	def void test_no_hubo_empate() {
		assertFalse(SUT.empate)
	}
	
	@Test
	def void test_este_duelo_fue_una_derrota() {
		assertEquals(SUT.tipoResultado,"Derrota")
	}
	
	@Test
	def void test_cuando_pido_el_resultado_ganador_obtengo_el_mayor_de_las_2_calificaciones() {
		assertEquals(SUT.resultadoGanador,calificacionRival)
	}
	
	@Test
	def void test_cuando_pido_el_perdedor_obtengo_al_correcto() {
		assertEquals(SUT.perdedor,retador)
	}
	
	@Test
	def void test_ante_un_empate_el_retador_sale_vencedor() {
		//Preparamos un contexto diferente
		var nuevoRetador = new Jugador("Lucas")
		var nuevoRival = new Jugador("Rosali")
		var otraCalificacionRetador = 100
		var otraCalificacionRival = 100
		
		//Obtenemos un nuevo ResultadoDuelo
		SUT = new ResultadoDuelo(nuevoRetador,otraCalificacionRetador,nuevoRival,otraCalificacionRival)
		
		//Verificamos que ante el empate, existe un ganador, y es el retador
		assertEquals(SUT.ganador,nuevoRetador)
	}
}