package DueloControllers

import java.util.List
import jugador.EstadisticaDePersonaje
import jugador.Posicion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DatosPersonajesJson {
	String id
	List<EstadisticaDePersonaje> estadisticasDePersonaje
	List<Posicion> posiciones
	
	new(String id,List<EstadisticaDePersonaje> estadisticasDePersonaje,List<Posicion> posiciones){
		this.id=id
		this.estadisticasDePersonaje = estadisticasDePersonaje
		this.posiciones = posiciones
	}
}