package appModel


import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.EstadisticasPj

import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors

class ResultadoDueloAppModel {
	
	DetalleJugadorDueloAppModel rival
	DetalleJugadorDueloAppModel retador
	Jugador ganador
	Jugador perdedor
	Integer resultadoGanador
	Integer resultadoPerdedor
	EstadisticasPj pjRetador
	EstadisticasPj pjRival
	Boolean empate = false
	String tipoResultado = ""
	
	new (DetalleJugadorDueloAppModel retador,DetalleJugadorDueloAppModel rival){
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

		System.out.println('''este es el pjRetador: ''' + arConRes.get(0).toString())
		System.out.println("este es el pjRival: "+arConRes.get(1).toString())
		System.out.println(retador.jugador.equals(rival.jugador))

		if (arConRes.get(0) > arConRes.get(1)) {
			ganador = retador.jugador
			perdedor = rival.jugador
			resultadoGanador = arConRes.get(0)
			resultadoPerdedor = arConRes.get(1)
			setTipoResultado("victoria")
		} else {
			if (arConRes.get(0) < arConRes.get(1)) {
				ganador = rival.jugador
				perdedor = retador.jugador
				resultadoPerdedor = arConRes.get(0) 
				resultadoGanador = arConRes.get(1) 
				setTipoResultado("derrota")
			}
			else {
				empate = true
				resultadoGanador = arConRes.get(0) 
				resultadoPerdedor = arConRes.get(1) 
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
