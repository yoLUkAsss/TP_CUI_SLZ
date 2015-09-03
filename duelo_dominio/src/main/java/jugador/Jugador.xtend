package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection

@Accessors
class Jugador {
	
	String nombre
	Collection<EstadisticasPj> est
	Collection<Denuncia> denuncias
	Integer cantPeleasGanadas
	
	new(){
		denuncias = newArrayList
		cantPeleasGanadas=0
	}
	
	def Double ranking(){
		(avgCalifPers(est) - avgPeso(denuncias)) 
		* cantPeleasGanadas
	}
	
	def private avgPeso(Collection<Denuncia> denuncias) {
		var avg = 0D
		for(d:denuncias){
			avg += d.peso
		}
		
		
		return avg / denuncias.size
	}
	
	def private avgCalifPers(Collection<EstadisticasPj> est) {
		var avg = 0D
		for(e:est){
			avg += e.puntaje
		}
		
		
		return avg / denuncias.size
	}
	
	def addDenuncia(Denuncia d){
		denuncias.add(d)
	}
	
	def Integer escalon(){
		var i = this.ranking()
		var j = 1
		while(i>0){
			i= i - 500
			j++
		}
		return j;
	}
	
	override toString(){
		return "Jugador: " + nombre + " Denuncias: "
		+ denuncias.size.toString() + " ranking: " + ranking().toString()
		+ "=> escalon: " + escalon().toString()
	}

	
}