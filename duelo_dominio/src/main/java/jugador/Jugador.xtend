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

	def ganeYSoyRival(Personaje p , Posicion pos , Integer califi) {
		buscarEst.apply(p).ganoComoRival(pos,califi)
	}
	
	def perdiYSoyRival(Personaje p , Posicion pos , Integer califi) {
		buscarEst.apply(p).perdioComoRival(pos,califi)
	}
	
	def ganeYSoyRetador(Personaje p , Posicion pos , Integer califi) {
		buscarEst.apply(p).ganoComoRetador(pos,califi)
	}
	
	def perdiYSoyRetador(Personaje p , Posicion pos , Integer califi) {
		buscarEst.apply(p).perdioComoRetador(pos,califi)
	}
	
	def empate(Personaje p , Posicion pos , Integer califi) {
		buscarEst.apply(p).empato()	
	}
	
	val buscarEst = [ Personaje p | 
		var estad = est.findFirst[estadistica | estadistica.nombre.equals(p.nombre)]
		if ((est.findFirst[estadistica | estadistica.nombre.equals(p.nombre)]) == null) {
			estad = new EstadisticasPj(p.nombre)
			this.est.add(estad)
		}
		return estad
	]
	
}
