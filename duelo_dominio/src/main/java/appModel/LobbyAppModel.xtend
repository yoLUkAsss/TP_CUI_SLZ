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
	
	//UTILIZADO PARA XT-Rest
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


///////////////////////////////////////
/////METODOS- DUELO-ClienteLiviano/////
///////////////////////////////////////
	new() {
		var Personaje amumu = new Personaje("Amumu",Posicion.TOP)
		var Personaje ahri = new Personaje("Ahri",Posicion.MID)
		var Personaje olaf = new Personaje("Olaf",Posicion.JUNGLE)
		var Personaje viper = new Personaje("Viper",Posicion.BOT)
		var Personaje pudge = new Personaje("Pudge",Posicion.BOT)
		var Personaje witchdoctor = new Personaje("WitchDoctor",Posicion.MID)
		var Jugador nico = new Jugador("Nico")
		nico.setUsuario("nicoLawl")
		nico.setPassword("1234")
		var Jugador rosali = new Jugador("Rosali")
		rosali.setUsuario("rosaliLawl")
		rosali.setPassword("1234")
		var Jugador lucas = new Jugador("Lucas")
		lucas.setUsuario("lucasLawl")
		lucas.setPassword("1234")
		var Jugador juaco = new Jugador("Juaco")
		juaco.setUsuario("juacoGrox")
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
		olaf.agregarNuevaFortaleza("Crowd-Control")
		olaf.agregarNuevaFortaleza("Crowd-Control")
		olaf.agregarNuevaFortaleza("Crowd-Control")
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
		jugadores.add(nico);jugadores.add(lucas);jugadores.add(rosali)
		juaco.ganeYSoyRetador(amumu,Posicion.TOP)
		
		this.setAll(null,jugadores,personajesUtilizables,posiciones)
	}
	
	def setAll(Jugador jugador,List<Jugador> jugadores , List<Personaje> pjs,List<Posicion> posiciones){
	    this.jugador=jugador
	    personajesTotales = pjs
	    this.jugadores = jugadores
	    this.posiciones = posiciones
		
	}
	def public static LobbyAppModel getInstance(){
		return instance;
	}
	
	def autentificar(Login log) {
		var jugadorAuxiliar = this.jugadores.findFirst[each| log.matches(each)]
		
		if(jugadorAuxiliar != null){
			this.jugadores.remove(jugadorAuxiliar)
			this.jugador = jugadorAuxiliar
			selectorRival = new SelectorDeRival(personajesTotales,jugadores)
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
	
	@Observable
	def iniciarDueloConPersonaje(Posicion pos, String personajeElegido){
		var personajeBuscado = this.personajesTotales.findFirst[personaje | personaje.nombre.equals(personajeElegido)]
		var detallesParaElDuelo  = new DetalleJugadorDuelo(jugador,personajeBuscado,pos)
		var rival = selectorRival.dameRival(detallesParaElDuelo)
			if (rival==null) throw new NoHayRivalException("NO HAY QUIEN SE LE ANIME EN SU ACTUAL RANKING")
		this.iniciarDuelo(detallesParaElDuelo,rival)
	}
	
	@Observable
	def iniciarDueloBotConPersonaje(Posicion pos, String personajeElegido){
		var personajeBuscado = this.personajesTotales.findFirst[personaje | personaje.nombre.equals(personajeElegido)]
		var detallesParaElDueloRetador  = new DetalleJugadorDuelo(jugador,personajeBuscado,pos)
		var MRX robot = new MRX("MR-X",jugador)
		var Personaje personajeRobot = selectorRival.determinarPersonaje(personajeBuscado)
		var detallesParaElDueloRival =  new DetalleJugadorDuelo(robot,personajeRobot,personajeRobot.getPosicionIdeal)
		this.iniciarDuelo(detallesParaElDueloRetador,detallesParaElDueloRival)
	}
	
	@Observable
	def obtenerRival(Personaje personajeExistente , DetalleJugadorDuelo retador) {
		var rival = selectorRival.dameRival(retador)
			if (rival==null){
				var MRX robot = new MRX("MR-X",jugador)
				var Personaje personajeRobot = selectorRival.determinarPersonaje(personajeExistente)
				return new DetalleJugadorDuelo(robot,personajeRobot,personajeRobot.getPosicionIdeal)
		    }
		return rival
	}
	
	@Observable
	def iniciarDuelo(DetalleJugadorDuelo detallesParaElDueloRetador , DetalleJugadorDuelo detallesParaElDueloRival){
		val res = new ResultadoDueloAppModel(detallesParaElDueloRetador,detallesParaElDueloRival)
		res.actualizarDatos()
		actualizarListado
		return res
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
		var MRX robot = new MRX("MRX",jugador)
		var Personaje personajeRobot = selectorRival.determinarPersonaje(estadisticaSeleccionada.personajeAsociado)
		var DetalleJugadorDuelo rival = new DetalleJugadorDuelo(robot,personajeRobot,personajeRobot.getPosicionIdeal)
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

}
