package jugador
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import denuncias.Denuncia
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Jugador {
	
	String nombre
	Collection<EstadisticasPj> est
	Collection<Denuncia> denuncias
	
	new(String nombre){
		this.nombre = nombre
		denuncias = newArrayList
		est = newArrayList
	}
	
	def ranking(){
		totPeso(denuncias)*cantPeleasGanadas(est)
	}
	
	def protected totPeso(Collection<Denuncia> denuncias) {
		denuncias.fold(0,[peso , den | peso +den.peso ])
	}

	def cantPeleasGanadas(Collection<EstadisticasPj> est) {
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
	
	def getEstadisticaCon(Personaje p){
		return est.findFirst[estadistica | estadistica.nombre.equals(p.nombre)]
	}
	
	val buscarEst = [ Personaje p | 
		var estad = est.findFirst[estadistica | estadistica.nombre.equals(p.nombre)]
		if (estad == null) {
			estad = new EstadisticasPj(p.nombre)
			this.est.add(estad)
		}
		return estad
	]
	
}
