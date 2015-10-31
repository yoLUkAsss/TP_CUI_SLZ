package DueloControllers

import java.util.List
import jugador.EstadisticaDePersonaje
import org.eclipse.xtend.lib.annotations.Accessors
import util.ResultadoDuelo
import jugador.Posicion
import appModel.ResultadoDueloAppModel
import util.InformacionJugador
import util.InformacionDuelo

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

