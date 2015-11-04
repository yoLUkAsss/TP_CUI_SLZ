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
		this.personajeRetador = resultado.pjRetador.personajeAsociado.nombre
		this.personajeRival = resultado.pjRival.personajeAsociado.nombre
		this.veredicto = resultado.description
		definirMensajes(datosDelDuelo.resultadoRetador,datosDelDuelo.resultadoRival)
		this.valorRetador = datosDelDuelo.resultadoRetador.toString
		this.valorRival = datosDelDuelo.resultadoRival.toString
		this.nombreGanador = datosDelDuelo.ganador.nombre
	}
	
	def private definirMensajes(Integer resultadoRetador, Integer resultadoRival) {
		if (resultadoRetador > resultadoRival){
			this.personajeGanador = this.personajeRetador
			this.mensaje = "Enhorabuena!"
			this.mensajeDelBoton = "Celebrar Victoria"
		} else {
			if (resultadoRetador < resultadoRival) {
				this.personajeGanador = this.personajeRival
				this.mensaje = "Honores Al Ganador:"
				this.mensajeDelBoton = "Aceptar Derrota"
			}
			else {//ESTO ES EN CASO DE EMPATE
				this.personajeGanador = this.personajeRetador
				this.mensaje = "Empataste"
				this.mensajeDelBoton = "Salir del Empate"
			}
		}
	}
}
