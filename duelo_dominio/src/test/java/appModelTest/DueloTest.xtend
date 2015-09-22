package appModelTest

import appModel.Duelo
import java.util.List
import jugador.Jugador
import jugador.Personaje
import org.junit.Before

class DueloTest {
	
	
	Duelo duelo
	Jugador jugador
	Jugador marquitos
	List<Jugador> jgdrs
	List<Personaje> pjs
	
	@Before 
	def void init(){
		jugador= new Jugador("pepe")
		marquitos = new Jugador("marquitos")
		jgdrs.add(marquitos);
		duelo= new Duelo(jugador,jgdrs,pjs)
		
	}
}