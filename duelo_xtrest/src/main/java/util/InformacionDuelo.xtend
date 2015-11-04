package util

import appModel.ResultadoDueloAppModel
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class InformacionDuelo {
	
	String veredicto
	String valorRetador
	String valorRival
	String nombreGanador
	String personajeGanador
	String personajeRetador
	String personajeRival
	String mensaje
	String mensajeDelBoton
	
	new (ResultadoDueloAppModel resultado){
		var datosDelDuelo = resultado.resDuelo
		this.veredicto = resultado.veredict
		this.valorRetador = datosDelDuelo.resultadoRetador.toString
		this.valorRival = datosDelDuelo.resultadoRival.toString
		this.nombreGanador = datosDelDuelo.ganador.nombre
		this.personajeRetador = resultado.pjRetador.personajeAsociado.nombre
		this.personajeRival = resultado.pjRival.personajeAsociado.nombre
		definirMensajes()
	}
	
	def private definirMensajes() {
		if (this.valorRetador > this.valorRival){
			this.personajeGanador = this.personajeRetador
			this.mensaje = "En Hora Buena!"
			this.mensajeDelBoton = "Celebrar Victoria"
		} else {
			if (this.valorRetador < this.valorRival) {
				this.personajeGanador = this.personajeRival
				this.mensaje = "Honores Al Ganador:"
				this.mensajeDelBoton = "Aceptar Derrota"
			}
			else {//ESTO ES EN CASO DE EMPATE
				this.personajeGanador = this.personajeRetador //Decision de los desarrolladores
				this.mensaje = "Empataste gatin"
				this.mensajeDelBoton = "Salir con verguenza"
			}
		}
	}
}
