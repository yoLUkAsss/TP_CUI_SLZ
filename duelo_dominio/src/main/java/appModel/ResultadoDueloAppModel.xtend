package appModel


import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import util.DetalleJugadorDuelo
import static org.uqbar.commons.model.ObservableUtils.*
import jugador.EstadisticaDePersonaje
import util.AnalizadorDeAtaque

@Observable
@Accessors

class ResultadoDueloAppModel {
	
	DetalleJugadorDuelo rival
	DetalleJugadorDuelo retador
	Jugador ganador
	Jugador perdedor
	Integer resultadoGanador
	Integer resultadoPerdedor
	EstadisticaDePersonaje pjRetador
	EstadisticaDePersonaje pjRival
	Boolean empate = false
	String tipoResultado = ""
	
	new (DetalleJugadorDuelo retador,DetalleJugadorDuelo rival){
		this.rival=rival
		this.retador=retador
	}
	
	def getDescription(){
		if(empate){
			return '''Empataste con: «rival.jugador.nombre»'''
		}	
		if(ganador.equals(retador.jugador)){
			return '''Le ganaste a: «rival.jugador.nombre»'''
		} 
		return '''Perdiste con: «rival.jugador.nombre»'''
	}
			
	def actualizarDatos () {
		
	
		var arConRes = this.resultadoDuelo()

		pjRetador = retador.jugador.est.findFirst[each | each.nombre.equals(retador.pj.nombre)]
		pjRival = rival.jugador.est.findFirst[each | each.nombre.equals(rival.pj.nombre)]

		if (arConRes.key > arConRes.value) {
			ganador = retador.jugador
			perdedor = rival.jugador
			resultadoGanador = arConRes.key
			resultadoPerdedor = arConRes.value
			setTipoResultado("victoria")
		} else {
			if (arConRes.key < arConRes.value) {
				ganador = rival.jugador
				perdedor = retador.jugador
				resultadoPerdedor = arConRes.key 
				resultadoGanador = arConRes.value 
				setTipoResultado("derrota")
			}
			else {
				empate = true
				resultadoGanador = arConRes.key 
				resultadoPerdedor = arConRes.value 
				setTipoResultado("empate")
			}
		firePropertyChanged(this,"description",description);
		}
	}
	
	 
	def analizador(){
		
		return new AnalizadorDeAtaque()
	}
	
	def getVeredict() {
		if(empate){
			return "Empate :("
		}
		
			return "Gandor: " + ganador.nombre + "!!!"
		
	}
	
	def getPuntaje() {
		return ''' - «resultadoGanador» Puntos contra «resultadoPerdedor»'''
	}
	
	def setTipoResultado (String s) {
		tipoResultado = s
		firePropertyChanged(this,"tipoResultado",tipoResultado)
	}
	
	def resultadoDuelo() {
		
		var analyzer = new AnalizadorDeAtaque()
	
		var arConRes = analyzer.realizarDuelo(
				retador.jugador,rival.jugador,
				retador.pj,rival.pj,
				retador.posElegida,rival.posElegida)
		  
		    arConRes
	}
	
}
