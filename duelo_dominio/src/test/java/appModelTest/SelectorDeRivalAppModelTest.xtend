package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import appModel.SelectorDeRivalAppModel
import appModel.DetalleJugadorDueloAppModel
import jugador.Jugador
import jugador.Personaje
import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDelSisDeDenuncias
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje
import jugador.Posicion

class SelectorDeRivalAppModelTest {
	
	SelectorDeRivalAppModel selector
	SelectorDeRivalAppModel selector1
	DetalleJugadorDueloAppModel detalle
	
	Jugador j1
	Jugador j2
	Jugador j3
	Jugador j4
	 
	Personaje p1
	Personaje p2
	Personaje p3
	Personaje p4
	
	DAbusoDeHabilidad d1
    DAbusoDelSisDeDenuncias d2
    DFeedIntencional d3
    DAbusoDeLenguaje d4
	
	Object rival
	
	@Before
	def void init() {
		
		j1= new Jugador("pepe")
		j2= new Jugador("jose")
		j3= new Jugador("azul")
		j4= new Jugador("sol")
		
		p1= new Personaje("ELISE",Posicion.TOP)
		p2= new Personaje("LIFESTEALER",Posicion.MID)
		p3= new Personaje("EVELYNN",Posicion.BOT)
		p4= new Personaje ("MEEPO",Posicion.JUNGLE)
		
		
		d1= new DAbusoDeHabilidad("denuncia1") 
		d2= new DAbusoDelSisDeDenuncias("denuncia2")
		d3= new DFeedIntencional("denuncia3")
		d4= new DAbusoDeLenguaje("denuncia4")
		
		
		detalle= new DetalleJugadorDueloAppModel(j1,p1,Posicion.JUNGLE)
		selector= new SelectorDeRivalAppModel()
		selector1= new SelectorDeRivalAppModel()
		
		selector.agregarJugador(j1)
		selector.agregarJugador(j2)
		selector.agregarJugador(j3)
		selector.agregarJugador(j4)
		
		selector.agregarPersonaje(p1)
		selector.agregarPersonaje(p2)
		selector.agregarPersonaje(p3)
		selector.agregarPersonaje(p4)
		
		j1.addDenuncia(d1)
		j1.addDenuncia(d2)
		
		j1.ganeYSoyRetador(p1,Posicion.TOP,30)
		
			
		j2.addDenuncia(d1)
		j2.addDenuncia(d2)
		
		j2.ganeYSoyRetador(p1,Posicion.TOP,30)
		j2.empate(p3,Posicion.JUNGLE,20)
		
		j3.addDenuncia(d3)
		j3.addDenuncia(d4)
		
		j3.empate(p1,Posicion.JUNGLE,25)
		j3.ganeYSoyRetador(p2,Posicion.TOP,60)
		
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		
		j4.ganeYSoyRetador(p2,Posicion.TOP,50)
		j4.ganeYSoyRetador(p1,Posicion.TOP,200)
	    j4.ganeYSoyRetador(p1,Posicion.TOP,200)
	    j4.ganeYSoyRetador(p1,Posicion.TOP,200)	
		
		
		
		
	}
	
	
	
	
	@Test
	def testNoHayRival() {
		
		assertEquals(null,selector1.dameRival(detalle))
	}
	
	
    @Test
    def testPuedeJugar() {
    	
    	assertTrue(selector.puedeJugar(j2.ranking(),j1.ranking()))
    	assertTrue(selector.puedeJugar(j3.ranking(),j1.ranking()))
    	assertFalse(selector.puedeJugar(j4.ranking(),j1.ranking()))
    
    	
    }
    
    @Test
    def testDeterminarPersonaje() {
    	
    	assertEquals(p1,selector.determinarPersonaje(p2))
    	assertEquals(p2,selector.determinarPersonaje(p1))
    	assertEquals(p1,selector.determinarPersonaje(p3))
    	
    }
    
    @Test
    def testProximoRival1() { 
    	 var DetalleJugadorDueloAppModel rival= selector.dameRival(detalle)
    	
    	assertEquals(j2,rival.jugador)
    	assertEquals(p2,rival.pj)
    	assertEquals("MID",rival.posElegida)
    	
    }
    
 
		
		
	
		
}