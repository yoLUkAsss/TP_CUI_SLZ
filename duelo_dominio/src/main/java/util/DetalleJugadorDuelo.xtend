package util

import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import jugador.Posicion
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
/**
 * Simple empaquetado de datos para la representacion
 * de un jugador en un duelo.
 * 
 * @author Sandoval Lucas
 * @author Leutwyler Nicolas
 * @author Zaracho Nicolas
 */
class DetalleJugadorDuelo {
	
	
	Jugador jugador
	Personaje pj
	Posicion posElegida
	
	new(Jugador jugador,Personaje pj, Posicion pos){
		this.jugador=jugador
		this.pj=pj
		this.posElegida=pos
	}
}