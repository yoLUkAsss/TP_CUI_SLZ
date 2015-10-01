package appModel

import jugador.Personaje
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import jugador.EstadisticaDePersonaje

@Observable
@Accessors
class EstadisticasArmadasAppModel implements Comparable{
	
	Personaje pjAsociado
	EstadisticaDePersonaje estAsociada
	
	new (Personaje p,EstadisticaDePersonaje e) {
		this.pjAsociado = p
		this.estAsociada = e
	}
	
	override compareTo(Object o) {
		var EstadisticasArmadasAppModel nuevo = o as EstadisticasArmadasAppModel
		return pjAsociado.nombre.compareTo(nuevo.pjAsociado.nombre)
	}
	
}