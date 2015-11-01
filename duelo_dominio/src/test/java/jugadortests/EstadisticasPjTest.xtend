package jugadortests


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.Posicion
import jugador.TipoCalificacion
import jugador.EstadisticaDePersonaje
import jugador.Personaje

class EstadisticasPjTest {
	
	EstadisticaDePersonaje est
	Personaje personajeSven
	
	
	 
	 @Before 
	 def void init(){
	 	est= new EstadisticaDePersonaje(personajeSven)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_iniciados() {
	 	assertEquals(0,est.duelosIniciados)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_ganados() {
	 	assertEquals(0,est.duelosGanados)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_ganados_no_iniciados() {
	 	assertEquals(0,est.duelosGanadosNoIniciados)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_derrotas_no_iniciadas() {
	 	assertEquals(0,est.derrotasNoIniciadas)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_empatados() {
	 	assertEquals(0,est.duelosEmpatados)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_mejor_ubicacion() {
	 	assertEquals(Posicion.NONE,est.mejorUbicacion)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_posiciones_usadas() {
	 	assertTrue(est.posicionesUsadas.empty)
	 }
	 
	 @Test
	 def void testEstadistica_nueva_duelos_calificacion() {
	 	assertEquals(TipoCalificacion.NOOB,est.calificacion)
	 }
	 
	 //SEPARACION DE ESTADISTICA===============================================
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_iniciados() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(1,est.duelosIniciados)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_ganados() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(1,est.duelosGanados)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_ganados_no_iniciados() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(1,est.duelosGanados)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_derrotas_no_iniciadas() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(0,est.derrotasNoIniciadas)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_empatados() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(0,est.duelosEmpatados)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_mejor_ubicacion() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(Posicion.TOP,est.mejorUbicacion)
	 }
	 
	 @Test
	 def void testEstadistica_gano_como_retador_duelos_calificacion() {
	 	est.ganoComoRetador(Posicion.TOP)
	 	assertEquals(TipoCalificacion.NOOB,est.calificacion)
	 }
	 
	 //SEPARACION DE ESTADISTICA=======================================================

	
	@Test	 
	def void testEstadistica_perdio_como_retador_duelos_iniciados() {
		est.perdioComoRetador(Posicion.JUNGLE) 
		assertEquals(1,est.duelosIniciados)
	}
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_ganados() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(0,est.duelosGanados)
	 }
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_ganados_no_iniciados() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(0,est.duelosGanados)
	 }
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_derrotas_no_iniciadas() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(0,est.derrotasNoIniciadas)
	 }
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_empatados() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(0,est.duelosEmpatados)
	 }
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_mejor_ubicacion() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(Posicion.JUNGLE,est.mejorUbicacion)
	 }
	 
	 @Test
	 def void testEstadistica_perdio_como_retador_duelos_calificacion() {
	 	est.perdioComoRetador(Posicion.JUNGLE) 
	 	assertEquals(TipoCalificacion.NOOB,est.calificacion)
	 }
}