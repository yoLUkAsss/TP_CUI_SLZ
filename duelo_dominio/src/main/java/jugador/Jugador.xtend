package jugador
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import denuncias.Denuncia

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
		totPeso(denuncias)
		* cantPeleasGanadas(est)
	}
	
	def private totPeso(Collection<Denuncia> denuncias) {
		denuncias.fold(0,[peso , den | peso +den.peso ])
	}

	def cantPeleasGanadas(Collection<EstadisticasPj> est) {
		est.fold(0 , [wins , pj | wins + pj.duelosGanados ])
	}
	
	def addDenuncia(Denuncia d){
		denuncias.add(d)
	}
	
	override equals(Object o) {
		true
	}
	
	override toString(){
		return "Jugador: " + nombre + " Denuncias: "
		+ denuncias.size.toString() + " ranking: " + ranking().toString()
	}
	
	
///////////////////
//Actualizaciones//
///////////////////

	def ganeYSoyRival(Personaje p , String pos , Integer califi) {
		buscarEst.apply(p).ganoComoRival(pos,califi)
	}
	
	def perdiYSoyRival(Personaje p , String pos , Integer califi) {
		buscarEst.apply(p).perdioComoRival(pos,califi)
	}
	
	def ganeYSoyRetador(Personaje p , String pos , Integer califi) {
		buscarEst.apply(p).ganoComoRetador(pos,califi)
	}
	
	def perdiYSoyRetador(Personaje p , String pos , Integer califi) {
		buscarEst.apply(p).perdioComoRetador(pos,califi)
	}
	
	def empate(Personaje p , String pos , Integer califi) {
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
