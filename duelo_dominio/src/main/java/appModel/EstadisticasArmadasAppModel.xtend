package appModel

import jugador.EstadisticasPj
import jugador.Personaje
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class EstadisticasArmadasAppModel {
	
	Personaje pjAsociado
	EstadisticasPj estAsociada
	
	new (Personaje p,EstadisticasPj e) {
		this.pjAsociado = p
		this.estAsociada = e
	}
}