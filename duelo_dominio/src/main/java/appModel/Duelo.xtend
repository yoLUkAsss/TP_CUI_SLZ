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
import util.DetalleJugadorDuelo
import util.PrepararEstadisticasPersonajes
import util.SelectorDeRival

@Observable
@Accessors
class Duelo {

	Jugador jugador
	DetalleJugadorDuelo retador
	List<Personaje> personajesTotales 
	List<Jugador> jgdrs

	List<EstadisticasArmadasAppModel> estadisticas = newArrayList
	List<EstadisticasArmadasAppModel> estadisticasAMostrar = newArrayList
	EstadisticasArmadasAppModel estadisticaSeleccionada
	String filtro
	SelectorDeRival selectorRival
	
	new(Jugador jugador,List<Jugador> jgdrs , List<Personaje> pjs){
	    this.jugador=jugador
	    personajesTotales = pjs
	    actualizarListado
		selectorRival = new SelectorDeRival(personajesTotales,jgdrs)
		//this.filtro=""
		
		//HAY Q SACAR
		
	}
	
	@Observable
	def iniciarDuelo(Posicion pos){
		retador = new DetalleJugadorDuelo(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDuelo rival= selectorRival.dameRival(retador)
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
		retador = new DetalleJugadorDuelo(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var MRX m = new MRX("MRX",jugador)
		var Personaje p = selectorRival.determinarPersonaje(estadisticaSeleccionada.pjAsociado)
		var DetalleJugadorDuelo rival = new DetalleJugadorDuelo(m,p,p.posIdeal)
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
		estadisticas = (new PrepararEstadisticasPersonajes(jugador,personajesTotales)).estadisticasPreparadas
		estadisticasAMostrar = estadisticas
		estadisticaSeleccionada = estadisticasAMostrar.get(0)
		firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
	}

}
