package appModel


import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.Posicion
import static org.uqbar.commons.model.ObservableUtils.*
import java.util.List
import excepciones.NoHayRivalException
import jugador.MRX

@Observable
@Accessors
class Duelo {

	Jugador jugador
	DetalleJugadorDueloAppModel retador
	List<Personaje> personajesTotales 
	List<Jugador> jgdrs

	List<EstadisticasArmadasAppModel> estadisticas = newArrayList
	List<EstadisticasArmadasAppModel> estadisticasAMostrar = newArrayList
	EstadisticasArmadasAppModel estadisticaSeleccionada
	String filtro
	SelectorDeRivalAppModel selectorRival
	
	new(Jugador jugador,List<Jugador> jgdrs , List<Personaje> pjs){
	    this.jugador=jugador
	    personajesTotales = pjs
	    actualizarListado
		selectorRival = new SelectorDeRivalAppModel(personajesTotales,jgdrs)
		//this.filtro=""
		
		//HAY Q SACAR
		
	}
	
	@Observable
	def iniciarDuelo(Posicion pos){
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival= selectorRival.dameRival(retador)
			if (rival==null){
				throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		    
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		actualizarListado
		return res
	}
	
	@Observable
	def iniciarDueloBot(Posicion pos) {
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var MRX m = new MRX("MRX",jugador)
		var Personaje p = selectorRival.determinarPersonaje(estadisticaSeleccionada.pjAsociado)
		var DetalleJugadorDueloAppModel rival = new DetalleJugadorDueloAppModel(m,p,p.posIdeal)
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		actualizarListado
		return res
	}
	

	@Observable
	def setFiltro(String s){
		filtro=s
		estadisticasAMostrar = filtrarLista(s)
		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
		firePropertyChanged(this,"filtro",filtro)
	}
	
	def filtrarLista(String s){
		var List<EstadisticasArmadasAppModel> ls =  newArrayList
		for(EstadisticasArmadasAppModel e : estadisticas){
			if(e.pjAsociado.nombre.contains(s)){
				ls.add(e)
			}
		}
		return ls
		
	}
	
	def getFiltro() {
		return filtro
	}
	
	@Observable
	def getEstadisticasAMostrar() {
		return estadisticasAMostrar
	}
	
	def actualizarListado() {
		estadisticas = (new PrepareEstadisticasPjsAppModel(jugador,personajesTotales)).estadisticasPreparadas
		estadisticasAMostrar = estadisticas
		estadisticaSeleccionada = estadisticasAMostrar.get(0)
		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
	}

}
