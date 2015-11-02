package appModel


import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import util.DetalleJugadorDuelo
import static org.uqbar.commons.model.ObservableUtils.*
import jugador.EstadisticaDePersonaje
import util.AnalizadorDeAtaque
import util.ResultadoDuelo

@Observable
@Accessors

class ResultadoDueloAppModel {
	
	DetalleJugadorDuelo rival
	DetalleJugadorDuelo retador
	EstadisticaDePersonaje pjRetador
	EstadisticaDePersonaje pjRival
	ResultadoDuelo resDuelo
	String tipoResultado = ""
	
	new (DetalleJugadorDuelo retador,DetalleJugadorDuelo rival){
		this.rival=rival
		this.retador=retador
	}
	
	def getDescription(){
		resDuelo.getDescription()
	}
	
	def getGanador(){
		resDuelo.ganador
	}
	
	def getPerdedor(){
		resDuelo.perdedor
	}
			
	def actualizarDatos () {
		
	
		resDuelo = this.resultadoDuelo()
		pjRetador = resDuelo.retador.getEstadisticaCon(retador.pj)
		pjRival = resDuelo.rival.getEstadisticaCon(rival.pj)
		setTipoResultado(resDuelo.tipoResultado)
		
		firePropertyChanged(this,"pjRetador",pjRetador);
		firePropertyChanged(this,"pjRival",pjRival);
	
	}
	
	def empate(){
		resDuelo.empate
	}
	
	
	 
	def analizador(){
		
		return new AnalizadorDeAtaque()
	}
	
	def getVeredict() {
		resDuelo.getVeredict()
	}
	
	def getPuntaje() {
		return resDuelo.puntaje
	}
	
	def setTipoResultado (String s) {
		tipoResultado = s
		firePropertyChanged(this,"tipoResultado",tipoResultado)
	}
	
	def resultadoDuelo() {
		
		var analyzer = analizador 
	
		var resultadoDuelo = analyzer.realizarDuelo(
				retador.jugador,rival.jugador,
				retador.pj,rival.pj,
				retador.posElegida,rival.posElegida)
		  
		resultadoDuelo
	}
	
}
