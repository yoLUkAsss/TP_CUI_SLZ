package util

import jugador.Posicion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SeleccionesDelJugador {
	
	String idJugador
	String idpersonajeJugador
	Posicion posicionJugador
	
	
	new (String idjugador,String idpersonajeJugador, Posicion posicionJugador ){
		
		this.idJugador=idjugador
		this.idpersonajeJugador=idpersonajeJugador
		this.posicionJugador = posicionJugador
	}
	
	new(){}
	
}