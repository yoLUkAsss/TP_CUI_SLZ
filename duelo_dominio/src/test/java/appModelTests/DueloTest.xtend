package appModelTests

import jugador.Jugador
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test
import jugador.Personaje
import appModel.Duelo
import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDelSisDeDenuncias
import denuncias.DFeedIntencional
import denuncias.DAbusoDeLenguaje

class DueloTest {

	Jugador retador
    Jugador j1
    Jugador j2 
    Jugador j3  
    
    Personaje p1
    Personaje p2 
    Personaje p3
    
    DAbusoDeHabilidad d1
    DAbusoDelSisDeDenuncias d2
    DFeedIntencional d3
    DAbusoDeLenguaje d4 
    
	Duelo duelo
	

    @Before 
	def void init() {
		
		
       	retador = new Jugador("pepe")
	    j1= new Jugador("jose")
		j2= new Jugador("pepita")
		j3= new Jugador("pepito")
		p1= new Personaje("personaje1","TOP")
		p2= new Personaje("personaje2","JUNGLE")
		p3= new Personaje("personaje3","TOP")
		 
		d1= new DAbusoDeHabilidad("denuncia1") 
		d2= new DAbusoDelSisDeDenuncias("denuncia2")
		d3= new DFeedIntencional("denuncia3")
		d4= new DAbusoDeLenguaje("denuncia4")
		 
		duelo= new Duelo(retador)
		//jugador
		duelo.jugadores.add(retador)
        duelo.jugadores.add(j1)  
        duelo.jugadores.add(j2)  
        duelo.jugadores.add(j3) 
        //personajes
        duelo.personajes.add(p1)
        duelo.personajes.add(p2)
        duelo.personajes.add(p3)
        
        
        //creo el contexto de todos los jugadores :P
		
		
		retador.addDenuncia(d1)
		retador.addDenuncia(d2)
		
		retador.ganeYSoyRetador(p1,"TOP",30)
		retador.empate(p3,"JUNGLE",20)
		retador.perdiYSoyRival(p3,"TOP",50)
			
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
 	def void testDatosRetador(){
 		
 		duelo.elegirPersonajeRetador(p1)
 		duelo.elegirPosicionRetador("TOP")
 		assertEquals(retador,duelo.retador)
 		assertEquals(p1,duelo.personajeRetador)
 		assertEquals("TOP",duelo.posicionRetador)
 	}
 	
 	
 	
 	
 	@Test
 	def void testProximoRival(){
 		  duelo.determinarRival()
 		
 		assertEquals(j1,duelo.rival)
 	}

 	
     

 	@Test
 	def void testDatosRival(){
 		
 		duelo.determinarRival()
 		duelo.determinarPersonajeRival()
 		duelo.determinarPosicionRival()
 		
 	    assertEquals(j1,duelo.rival)
 		
 		
 	}

  	
 
}


