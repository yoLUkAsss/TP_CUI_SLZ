package util

import jugador.Posicion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class SeleccionesDelJugador {
	
	String idJugador
	String idPersonajeJugador
	Posicion posicionJugador
	
	
	new (String idjugador,String idpersonajeJugador, Posicion posicionJugador ){
		
		this.idJugador=idjugador
		this.idPersonajeJugador=idpersonajeJugador
		this.posicionJugador = posicionJugador
	}
	
	new(){}
	
}