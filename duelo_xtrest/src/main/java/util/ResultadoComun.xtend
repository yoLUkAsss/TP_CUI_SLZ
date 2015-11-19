package util

import appModel.ResultadoDueloAppModel
import org.eclipse.xtend.lib.annotations.Accessors
import util.InformacionDuelo
import org.uqbar.commons.utils.Observable
import util.InformacionJugador

@Observable
@Accessors
class ResultadoComun {
	InformacionJugador informacionDelRetador
	InformacionJugador informacionDelRival
	InformacionDuelo resultadoDuelo
	
	new (ResultadoDueloAppModel resultado){
		this.informacionDelRetador = new InformacionJugador(resultado.pjRetador)
		this.informacionDelRival = new InformacionJugador(resultado.pjRival)
		this.resultadoDuelo = new InformacionDuelo(resultado)
	}
}

