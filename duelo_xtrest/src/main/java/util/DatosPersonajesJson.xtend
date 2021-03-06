package util

import java.util.List
import jugador.EstadisticaDePersonaje
import jugador.Posicion
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable
import org.uqbar.commons.utils.Observable

@Observable
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