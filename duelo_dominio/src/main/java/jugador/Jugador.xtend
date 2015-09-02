package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection

@Accessors
class Jugador {
	
	EstadisticasPj est
	Collection<Denuncia> denuncias
	
	def ranking(){
		avgPeso(denuncias)
	}
	
	def private avgPeso(Collection<Denuncia> denuncias) {
		var avg = 0D
		for(d:denuncias){
			avg += d.peso
		}
		
		return avg / denuncias.size
	}
	
	def denunciar(String motivo,String descripcion,Jugador j){
		
	}
	
}