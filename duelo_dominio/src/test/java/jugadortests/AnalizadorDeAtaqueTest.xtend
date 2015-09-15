package jugadortests

import appModel.AnalizadorDeAtaque
import jugador.Personaje
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import jugador.Jugador
import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDelSisDeDenuncias
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje

class AnalizadorDeAtaqueTest {
	
    Jugador j1
    Jugador j2 
    Jugador j3
	
	DAbusoDeHabilidad d1
    DAbusoDelSisDeDenuncias d2
    DFeedIntencional d3
    DAbusoDeLenguaje d4 
	
	
	Personaje p1
	Personaje p2 
	Personaje p3
	AnalizadorDeAtaque analizador
	
	 @Before
	 def void init(){
	 	
	 	d1= new DAbusoDeHabilidad("denuncia1") 
		d2= new DAbusoDelSisDeDenuncias("denuncia2")
		d3= new DFeedIntencional("denuncia3")
		d4= new DAbusoDeLenguaje("denuncia4")
	 	
	 	j1= new Jugador("pepe")
	 	j2= new Jugador("pepita")
	    j3= new Jugador("jose")
	     
	 	p1= new Personaje("personaje1","TOP")
	 	p2=new Personaje ("personaje2","JUNGLE")
	 	p3= new Personaje("Personaje3","JUNGLE")
	 	analizador= new AnalizadorDeAtaque()
	 	
	 	j1.addDenuncia(d1)
		j1.addDenuncia(d2)
		
		j1.ganeYSoyRetador(p1,"TOP",30)
		j1.empate(p3,"JUNGLE",20)
		j1.perdiYSoyRival(p3,"TOP",50)
		
		
		j2.addDenuncia(d3)
		j2.addDenuncia(d4)
		
		j2.empate(p1,"JUNGLE",25)
		j2.ganeYSoyRetador(p2,"TOP",60)
		
		j3.addDenuncia(d2)
		j3.addDenuncia(d3)
		
		j3.perdiYSoyRetador(p2,"TOP",50)
		j3.empate(p1,"JUNGLE",60)
	 	
	 	
	 	
	 	
	 }
	
	
	@Test
	def void testPoderDeAtaqueJugador1(){
		
		assertEquals(60,analizador.poderDeAtaque(j1,p2,"TOP"))
	}
	
	
	
}