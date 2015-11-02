package DueloControllers

import java.util.List
import jugador.EstadisticaDePersonaje
import jugador.Posicion
import org.eclipse.xtend.lib.annotations.Accessors
import util.InformacionEstadisticas
import util.InformacionEstadistica
import java.io.Serializable

@Accessors
class DatosPersonajesJson implements Serializable{
	String id
	List<EstadisticaDePersonaje> estadisticasDePersonaje
	List<String> posiciones
	
	new(String id,List<EstadisticaDePersonaje> estadisticasDePersonaje,List<Posicion> posiciones){
		this.id=id
		this.estadisticasDePersonaje = estadisticasDePersonaje
		this.posiciones = comoStrings(posiciones)
	}
	
	def comoStrings(List<Posicion> posicions) {
		var List<String> res = newArrayList
		for(pos:posicions){
			res.add(pos.toString())
		}
		return res
	}
	

}