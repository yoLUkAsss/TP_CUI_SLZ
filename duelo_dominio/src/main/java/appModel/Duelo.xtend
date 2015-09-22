package appModel


import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.Posicion
import static org.uqbar.commons.model.ObservableUtils.*
import java.util.List

@Observable
@Accessors
class Duelo {

	Jugador jugador
	DetalleJugadorDueloAppModel retador
	List<Personaje> personajesTotales 
	List<Jugador> jgdrs

	List<EstadisticasArmadasAppModel> estadisticas = newArrayList
	Collection<EstadisticasArmadasAppModel> estadisticasAMostrar = newArrayList
	EstadisticasArmadasAppModel estadisticaSeleccionada
	String filtrarLista
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
				return null//throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		    //firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		return res
	}
	
	@Observable
	def iniciarDueloBot(Posicion pos) {
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival = retador
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		return res
	}
	
	@Observable
	def setFiltrarLista (String s) {
		if (s.equals("")) {
			estadisticasAMostrar = estadisticas
		} else {
			var List<EstadisticasArmadasAppModel> aMostrar = newArrayList
			
				for (e : estadisticas) {
					if (e.pjAsociado.nombre.contains(s))
						aMostrar.add(e)
				}
			estadisticasAMostrar = aMostrar
		}
		estadisticaSeleccionada = estadisticasAMostrar.get(0)
		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)	
	}
	
	def getFiltrarLista() {
		return filtrarLista
	}
//	@Observable
//	def setFiltro(String s){
//		filtro=s
//		estadisticasAMostrar = filtrarLista(s)
//		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
//		firePropertyChanged(this,"filtro",filtro)
//	}
//	
//	def getFiltro() {
//		return filtro
//	}
	
	def getEstadisticasAMostrar() {
		return (new PrepareEstadisticasPjsAppModel(jugador,personajesTotales)).estadisticasPreparadas
	}
	
	def actualizarListado() {
		estadisticas = getEstadisticasAMostrar
		estadisticasAMostrar = estadisticas
		estadisticaSeleccionada = estadisticasAMostrar.get(0)
		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
	}

}
