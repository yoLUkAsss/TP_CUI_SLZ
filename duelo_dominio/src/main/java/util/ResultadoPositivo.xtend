package util

import jugador.Jugador

/**
 * Es un objeto encargado de representar la informacion respecto a 
 * las diferentes posibilidades que se pueden obtener al denunciar a un jugador
 */
abstract class Resultado{
	
	protected Jugador jugador
	
	
	new(Jugador jugador){
		this.jugador=jugador
	}
	
	/**
	 * Mensajes a mostrar de acuerdo a cada resultado
	 */
	def String getTitle();
	def String getDescription();
}



class ResultadoPositivo extends Resultado{
	

	new(Jugador jugador){
		super(jugador)
	}
	
	override getTitle() {
		return '''Hemos sancionado a: «jugador.nombre»'''
	}
	
	override getDescription() {
		return '''En Duelo de Leyendas somos partidarios del fair play.\n Gracias por ayudarnos a mantenernos asi'''
	}
	
	
	
}

class ResultadoNegativo extends Resultado{
	
	new(Jugador jugador) {
		super(jugador)
	}
	
	override getTitle() {
		return '''Has sido sancionado: «jugador.nombre»'''
	}
	
	override getDescription() {
		return "Hemos detectado que tu denuncia no tiene fundamentos solidos.
En duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play. 
Con lo que has recibido una sancion por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud"
	}
	
}