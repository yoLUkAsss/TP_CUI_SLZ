package appModel


import java.util.Collection
import jugador.Jugador
import jugador.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.TransactionalAndObservable
import jugador.Posicion
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class Duelo {

	Jugador jugador
	DetalleJugadorDueloAppModel retador
	Collection<Personaje> personajesTotales 

	Collection<EstadisticasArmadasAppModel> estadisticas = newArrayList
	Collection<EstadisticasArmadasAppModel> estadisticasAMostrar = newArrayList
	EstadisticasArmadasAppModel estadisticaSeleccionada
	String filtro
	
	new(Jugador jugador){
	    this.jugador=jugador
	    personajesTotales = newArrayList
	    personajesTotales.add(new Personaje("Amumu",Posicion.TOP))
		personajesTotales.add(new Personaje("Ahri",Posicion.MID))
		personajesTotales.add(new Personaje("Olaf",Posicion.JUNGLE))
		personajesTotales.add(new Personaje("Cait",Posicion.BOT))
	    this.estadisticas = getEstadisticasAMostrar() 
		this.estadisticaSeleccionada = this.estadisticas.get(0)
		estadisticasAMostrar = estadisticas
		this.filtro=""
		
		//HAY Q SACAR
		
	}
	
	@Observable
	def iniciarDuelo(Posicion pos){
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival= new SelectorDeRivalAppModel(personajesTotales).dameRival(retador)
			if (rival==null){
				return null//throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		    //firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		estadisticas = (new PrepareEstadisticasPjsAppModel(jugador.est,personajesTotales)).estadisticasPreparadas
		estadisticasAMostrar = estadisticas
		estadisticaSeleccionada = estadisticasAMostrar.get(0)
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
		return res
	}
	
	@Observable
	def iniciarDueloBot(Posicion pos) {
		retador = new DetalleJugadorDueloAppModel(jugador,estadisticaSeleccionada.pjAsociado,pos)
		var DetalleJugadorDueloAppModel rival = retador
		val res = new ResultadoDueloAppModel(retador,rival)
		res.actualizarDatos()
		firePropertyChanged(this,"estadisticaSeleccionada",estadisticaSeleccionada)
		return res
	}
	
	@Observable
	def filtrarLista (String s) {
		if (s.equals("")) {
			return estadisticasAMostrar
		}
		
		var Collection<EstadisticasArmadasAppModel> aMostrar = newArrayList
		
			for (e : estadisticas) {
				if (e.pjAsociado.nombre.contains(s))
					aMostrar.add(e)
			}
			estadisticasAMostrar = aMostrar
			firePropertyChanged(this,"estadisticasAMostrar",estadisticasAMostrar)
	}
	
	@Observable
	def setFiltro(String s){
		filtro=s
		filtrarLista(s)
		firePropertyChanged(this,"filtro",filtro)
	}
	
	def getEstadisticasAMostrar() {
		return (new PrepareEstadisticasPjsAppModel(jugador.est,personajesTotales)).estadisticasPreparadas
	}

}
