package appModel

import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DetalleJugadorDueloAppModel {
	
	
	Jugador jugador
	Personaje pj
	String posElegida
	
	new(Jugador jugador,Personaje pj, String pos){
		this.jugador=jugador
		this.pj=pj
		this.posElegida=pos
	}
}