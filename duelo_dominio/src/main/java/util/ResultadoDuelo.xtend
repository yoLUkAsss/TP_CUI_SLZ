package util

import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ResultadoDuelo {
	Jugador retador
	Jugador rival
	Integer resultadoRetador
	Integer resultadoRival
	
	new(Jugador retador,Integer resultadoRetador,Jugador rival,Integer resultadoRival){
		this.retador=retador
		this.rival=rival
		this.resultadoRetador=resultadoRetador
		this.resultadoRival=resultadoRival
	}
	def empate(){
		resultadoRetador.equals(resultadoRival)
	}
	
	def tipoResultado(){
		if(this.empate()){
			return "Empate"
		}
		if(resultadoRetador >= resultadoRival){
			return "Victoria"
		}return "Derrota"
	}
	
	def getVeredict() {
		if(this.empate()){
			return "Empate :("
		}
		
			return "Gandor: " + ganador().nombre + "!!!"
		
	}
	def resultadoGanador(){
		Math.max(resultadoRetador,resultadoRival)
	}
	
	def resultadoPerdedor(){
		if(resultadoRetador < resultadoRival) return resultadoRetador
		return resultadoRival
	}
	
	def ganador(){
		if(resultadoRetador >= resultadoRival) return retador
		return rival
	}
	
	def perdedor(){
		if(resultadoRetador < resultadoRival) return retador
		return rival
	}
	
	def getDescription(){
		if (this.empate()) {
			return '''Empataste con: «rival.nombre»'''
		}
		if (resultadoRetador > resultadoRival) {
			return '''Le ganaste a: «rival.nombre»'''
		}
		return '''Perdiste con: «rival.nombre»'''
	}
	
	def String getPuntaje(){
		''' - «this.resultadoGanador()» Puntos contra «this.resultadoPerdedor()»'''
	}
	
}