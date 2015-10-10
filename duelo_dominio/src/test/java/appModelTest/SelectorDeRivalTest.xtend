package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import util.DetalleJugadorDuelo
import jugador.Jugador
import jugador.Personaje
import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDelSisDeDenuncias
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje
import jugador.Posicion
import java.util.Collection
import java.util.List

import util.SelectorDeRival

class SelectorDeRivalTest {
	
	SelectorDeRival selector
	SelectorDeRival selector1
	DetalleJugadorDuelo detalle
	
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
		
		var List<Personaje> col = newArrayList
		var List<Jugador> jgdrs = newArrayList
		var List<Jugador> jgdrs1 = newArrayList
		col.add(p1);col.add(p2);col.add(p3);col.add(p4)
		
		detalle= new DetalleJugadorDuelo(j1,p1,Posicion.JUNGLE)
		selector= new SelectorDeRival(col,jgdrs)
		selector1= new SelectorDeRival(col,jgdrs1)
		
		selector.agregarJugador(j1)
		selector.agregarJugador(j2)
		selector.agregarJugador(j3)
		selector.agregarJugador(j4)
		
		j1.addDenuncia(d1)
		j1.addDenuncia(d2)
		
		j1.ganeYSoyRetador(p1,Posicion.TOP)
		
			
		j2.addDenuncia(d1)
		j2.addDenuncia(d2)
		
		j2.ganeYSoyRetador(p1,Posicion.TOP)
		j2.empateComoRival(p3,Posicion.JUNGLE)
		
		j3.addDenuncia(d3)
		j3.addDenuncia(d4)
		
		j3.empateComoRival(p1,Posicion.JUNGLE)
		j3.ganeYSoyRetador(p2,Posicion.TOP)
		
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		j4.addDenuncia(d2)
		
		j4.ganeYSoyRetador(p2,Posicion.TOP)
		j4.ganeYSoyRetador(p1,Posicion.TOP)
	    j4.ganeYSoyRetador(p1,Posicion.TOP)
	    j4.ganeYSoyRetador(p1,Posicion.TOP)	
		
		
		
		
	}
	
    @Test
    def testPuedeJugar() {
    	
    	assertTrue(selector.puedeJugar(j2.ranking(),j1.ranking()))
    	assertTrue(selector.puedeJugar(j3.ranking(),j1.ranking()))
    	assertFalse(selector.puedeJugar(j4.ranking(),j1.ranking()))
    }
    
   
    @Test
    def testProximoRival1() { 
    	var DetalleJugadorDuelo rival= selector.dameRival(detalle)
    	
    	assertNotEquals(rival.jugador,detalle.jugador)
    	assertNotEquals(rival.pj,detalle.pj)
    	
    }
    
 
		
		
	
		
}