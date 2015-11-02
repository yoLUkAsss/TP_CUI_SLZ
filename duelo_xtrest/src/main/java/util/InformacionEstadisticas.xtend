package util

import jugador.EstadisticaDePersonaje
import java.util.List

class InformacionEstadisticas {
	
	List<InformacionEstadistica> estadisticas
	
	new (List<EstadisticaDePersonaje> estadisticas) {
		this.estadisticas = armarEstadisticas(estadisticas)
	}
	
	def armarEstadisticas(List<EstadisticaDePersonaje> estadisticas) {
		var aRetornar = newArrayList
		for (EstadisticaDePersonaje est : estadisticas){
			aRetornar.add(new InformacionEstadistica(est))
		}
		return aRetornar
	}
	
	def valores(){
		return this.estadisticas
	}
}