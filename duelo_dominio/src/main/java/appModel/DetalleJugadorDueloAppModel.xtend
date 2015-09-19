package appModel

import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import jugador.Posicion

@Accessors
class DetalleJugadorDueloAppModel {
	
	
	Jugador jugador
	Personaje pj
	Posicion posElegida
	
	new(Jugador jugador,Personaje pj, Posicion pos){
		this.jugador=jugador
		this.pj=pj
		this.posElegida=pos
	}
}