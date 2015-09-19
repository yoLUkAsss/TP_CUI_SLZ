package appModel

class AJugarConElRobotAppModel {
	
	
	DetalleJugadorDueloAppModel jugador
	DetalleJugadorDueloAppModel robot
	
	
	new (DetalleJugadorDueloAppModel jug) {
		this.jugador = jug
	}
	
	def jugar() {
		robot = jugador
	}
}