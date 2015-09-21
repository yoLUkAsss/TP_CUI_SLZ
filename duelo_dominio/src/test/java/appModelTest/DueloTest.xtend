package appModelTest


import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import appModel.Duelo
import appModel.SelectorDeRivalAppModel
import jugador.Jugador
import excepciones.NoHayRivalException
import jugador.Posicion
import java.util.Collection
import java.util.List

class DueloTest {
	
	
	Duelo duelo
	Jugador jugador
	Jugador marquitos
	List<Jugador> jgdrs
	
	@Before 
	def void init(){
		jugador= new Jugador("pepe")
		marquitos = new Jugador("marquitos")
		jgdrs.add(marquitos);
		duelo= new Duelo(jugador,jgdrs)
		
	}
}