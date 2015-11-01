package appModel

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
import jugador.EstadisticaDePersonaje
import javax.naming.AuthenticationException
import util.Login
import excepciones.NoEstaAutenticadoException

@Observable
@Accessors
class LobbyAppModel {
	
	private static final LobbyAppModel instance = new LobbyAppModel();

	Jugador jugador
	List<Personaje> personajesTotales 
	List<Jugador> jugadores
	List<Posicion> posiciones
	List<EstadisticaDePersonaje> estadisticas = newArrayList
	List<EstadisticaDePersonaje> estadisticasAMostrar = newArrayList
	EstadisticaDePersonaje estadisticaSeleccionada
	String filtro
	SelectorDeRival selectorRival
	
	new(Jugador jugador,List<Jugador> jugadores , List<Personaje> pjs){
	    this.jugador=jugador
	    personajesTotales = pjs
	    actualizarListado
		selectorRival = new SelectorDeRival(personajesTotales,jugadores)
		this.jugadores = jugadores
	}
	
	new() {
		var Personaje amumu = new Personaje("amumu",Posicion.TOP)
		var Personaje ahri = new Personaje("ahri",Posicion.MID)
		var Personaje olaf = new Personaje("olaf",Posicion.JUNGLE)
		var Personaje viper = new Personaje("viper",Posicion.BOT)
		var Personaje pudge = new Personaje("pudge",Posicion.BOT)
		var Personaje witchdoctor = new Personaje("witchdoctor",Posicion.MID)
		var Jugador juaco = new Jugador("Juaco")
		juaco.setUsuario("latengoverde")
		juaco.setPassword("1234")
		var Jugador marq = new Jugador("Marquitos")
		marq.setUsuario("elMasCapo")
		marq.setPassword("1234")
		var Jugador xPeke = new Jugador("xPeke")
		xPeke.setUsuario("iGzo")
		xPeke.setPassword("4321")
		var List<Personaje> personajesUtilizables = newArrayList
		var List<Posicion> posiciones = newArrayList
		posiciones.add(Posicion.TOP);posiciones.add(Posicion.BOT)
		posiciones.add(Posicion.JUNGLE);posiciones.add(Posicion.MID);
		
		amumu.agregarNuevaFortaleza("Tanque")
		amumu.agregarNuevaFortaleza("Mago")
		amumu.agregarNuevaDebilidad("Crowd-Control")
		
		ahri.agregarNuevaFortaleza("Mago")
		ahri.agregarNuevaFortaleza("Buena Movilidad")
		ahri.agregarNuevaDebilidad("Amor")
		
		olaf.agregarNuevaFortaleza("Tanque")
		olaf.agregarNuevaFortaleza("Crowd-Control")
		olaf.agregarNuevaDebilidad("Daño Magico")
		olaf.agregarNuevaDebilidad("Velocidad")
		
		viper.agregarNuevaFortaleza("Rango de ataque")
		viper.agregarNuevaDebilidad("Crowd-Control")
		
		pudge.agregarNuevaDebilidad("Daño Magico")
		pudge.agregarNuevaFortaleza("Taque")
		
		witchdoctor.agregarNuevaFortaleza("Daño Magico")
		witchdoctor.agregarNuevaDebilidad("Taque")
		
		
		personajesUtilizables.add(amumu)
		personajesUtilizables.add(ahri)
		personajesUtilizables.add(olaf)
		personajesUtilizables.add(viper)
		personajesUtilizables.add(witchdoctor)
		personajesUtilizables.add(pudge)
		
		var List<Jugador> jugadores = newArrayList
		jugadores.add(marq);jugadores.add(xPeke);jugadores.add(juaco)
		juaco.ganeYSoyRetador(amumu,Posicion.TOP)
		
		this.setAll(null,jugadores,personajesUtilizables,posiciones)
	}
	
	def setAll(Jugador jugador,List<Jugador> jugadores , List<Personaje> pjs,List<Posicion> posiciones){
	    this.jugador=jugador
	    personajesTotales = pjs
	    selectorRival = new SelectorDeRival(personajesTotales,jugadores)
	    this.jugadores = jugadores
	    this.posiciones = posiciones
		
	}
	def public static LobbyAppModel getInstance(){
		return instance;
	}
		
	
	
	@Observable
	def iniciarDuelo(Posicion pos){
		var detallesParaElDuelo = new DetalleJugadorDuelo(jugador,estadisticaSeleccionada.personajeAsociado,pos)
		var DetalleJugadorDuelo rival= selectorRival.dameRival(detallesParaElDuelo)
			if (rival==null){
				throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		    }
		    
		val res = new ResultadoDueloAppModel(detallesParaElDuelo,rival)
		res.actualizarDatos()
		actualizarListado
		return res
	}
	
	@Observable
	def iniciarDueloBot(Posicion pos) {
		var detallesParaElDuelo = new DetalleJugadorDuelo(jugador,estadisticaSeleccionada.personajeAsociado,pos)
		var MRX m = new MRX("MRX",jugador)
		var Personaje p = selectorRival.determinarPersonaje(estadisticaSeleccionada.personajeAsociado)
		var DetalleJugadorDuelo rival = new DetalleJugadorDuelo(m,p,p.getPosicionIdeal)
		val res = new ResultadoDueloAppModel(detallesParaElDuelo,rival)
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
		var List<EstadisticaDePersonaje> ls =  newArrayList
		for(EstadisticaDePersonaje e : estadisticas){
			if(e.nombreDelPersonaje.contains(s)){
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
	
	def autentificar(Login log) {
		var jugadorAuxiliar = this.jugadores.findFirst[each| log.matches(each)]
		//var jugadorAuxiliar =this.jugadores.findFirst[each | each.identifies(usuario,password)]
		
		if(jugadorAuxiliar != null){
			this.jugadores.remove(jugadorAuxiliar)
			this.jugador = jugadorAuxiliar
			this.actualizarListado()
			jugadorAuxiliar	
		}
		else
			throw new AuthenticationException("Usuario o password invalido")
	}
	
	def estaAutenticado(String nombreUsuario) {
		this.jugador != null && nombreUsuario.equals(this.jugador.nombre)
	}
	
	def salir(String nombreDeUsuario){
		if(estaAutenticado(nombreDeUsuario)){
			this.jugadores.add(this.jugador);
			this.jugador=null
		}
		else throw new NoEstaAutenticadoException("Deslog incorrecto")
	}
	


}
