package jugador

import denuncias.Denuncia
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Jugador {
	
	String nombre
	String usuario
	String password
	Collection<EstadisticaDePersonaje> est
	Collection<Denuncia> denuncias
	
	new(String nombre){
		this.nombre = nombre
		denuncias = newArrayList
		est = newArrayList
		this.usuario=""
		this.password=""
	}
	
	
	def ranking(){
		totPeso(denuncias)*cantPeleasGanadas(est)
	}
	
	def protected totPeso(Collection<Denuncia> denuncias) {
		denuncias.fold(0,[peso , den | peso +den.peso ])
	}

	def cantPeleasGanadas(Collection<EstadisticaDePersonaje> est) {
		est.fold(0 , [wins , pj | wins + pj.duelosGanados ])
	}
	
	def void addDenuncia(Denuncia d){
		denuncias.add(d)
	}
	
	override equals(Object o) {
		if (o != null && o instanceof Jugador){
			var Jugador p = o as Jugador
			return p.nombre.equals(this.nombre)
		}
		return false
	}
	
	
	
	
///////////////////
//Actualizaciones//
///////////////////

	def setTipoCalificacion(Personaje p , TipoCalificacion t) {
		buscarEst.apply(p).calificacion = t
	}

	def ganeYSoyRival(Personaje p , Posicion pos) {
		buscarEst.apply(p).ganoComoRival(pos)
	}
	
	def perdiYSoyRival(Personaje p , Posicion pos) {
		buscarEst.apply(p).perdioComoRival(pos)
	}
	
	def ganeYSoyRetador(Personaje p , Posicion pos) {
		buscarEst.apply(p).ganoComoRetador(pos)
	}
	
	def perdiYSoyRetador(Personaje p , Posicion pos) {
		buscarEst.apply(p).perdioComoRetador(pos)
	}
	
	def empateComoRetador(Personaje p , Posicion pos) {
		buscarEst.apply(p).empatoComoRetador(pos)	
	}
	
	def empateComoRival(Personaje p , Posicion pos) {
		buscarEst.apply(p).empatoComoRival(pos)	
	}
	
	def getEstadisticaCon(Personaje personaje){
		return est.findFirst[estadistica | estadistica.esDeEstePersonaje(personaje)]
	}
	
	val buscarEst = [ Personaje personajeABuscar | 
		var estad = est.findFirst[estadistica | estadistica.esDeEstePersonaje(personajeABuscar)]
		if (estad == null) {
			estad = new EstadisticaDePersonaje(personajeABuscar)
			this.est.add(estad)
		}
		return estad
	]
	
	//Retorna la cantidad de veces que jugo con el personaje, en su pocicion ideal
	def experienciaPreviaConElPersonajeEnLaPosicionIdeal(Personaje personaje) {
		var estadistica = this.est.findFirst[each | each.esDeEstePersonaje(personaje)]
		if (estadistica == null)
			return 0
		return (estadistica.posicionesUsadas.filter[each | each.equals(personaje.posicionIdeal)]).size
	}
	
	//Retorna la cantidad de veces que utilizo independientemente del personaje
	//en la posicion indicada
	def expPreviaEnPosicion(Posicion posicion) {
		var estadisticas = est
		estadisticas.fold(0 ,[cant , estad | cant+ estad.posicionesUsadas(posicion)])
	}
	
	def estadisticaDelPersonaje(Personaje personaje) {
		val estadistica = est.findFirst([each | each.esDeEstePersonaje(personaje)  ])
		if (estadistica == null)
			return null
		else
			return estadistica
	}
	
	def identifies(String usuario, String password) {
		this.usuario.equals(usuario) && this.password.equals(password)
	}
	

	
}
