package appModel

import jugador.Jugador
abstract class Resultado{
	protected Jugador j
	new(Jugador j){
		this.j=j
	}
	
	def String getTitle();
	
	def String getDescription();
}



class ResultadoPositivo extends Resultado{
	

	new(Jugador j){
		super(j)
	}
	
	override getTitle() {
		return '''Hemos sancionado a: «j.nombre»'''
	}
	
	override getDescription() {
		return '''En Duelo de Leyendas somos partidarios del fair play.\n Gracias por ayudarnos a mantenernos asi'''
	}
	
	
	
}

class ResultadoNegativo extends Resultado{
	
	new(Jugador j) {
		super(j)
	}
	
	override getTitle() {
		return '''Has sido sancionado: «j.nombre»'''
	}
	
	override getDescription() {
		return "Hemos detectado que tu denuncia no tiene fundamentos solidos.
En duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play. 
Con lo que has recibido una sancion por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud"
	}
	
}