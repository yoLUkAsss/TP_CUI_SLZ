package jugador
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection

@Accessors
class Jugador {
	
	String nombre
	Collection<EstadisticasPj> est
	Collection<Denuncia> denuncias
	
	new(){
		denuncias = newArrayList
		est = newArrayList
	}
	
	def Double ranking(){
		totPeso(denuncias)
		* cantPeleasGanadas(est)
	}
	
	def private totPeso(Collection<Denuncia> denuncias) {
		denuncias.fold(0,[peso , den | peso +den.peso ])
	}

	def Double cantPeleasGanadas(Collection<EstadisticasPj> est) {
		est.fold(0D , [wins , pj | wins + pj.duelosGanados ])
	}
	
	def addDenuncia(Denuncia d){
		denuncias.add(d)
	}
	
	override toString(){
		return "Jugador: " + nombre + " Denuncias: "
		+ denuncias.size.toString() + " ranking: " + ranking().toString()
	}
}
