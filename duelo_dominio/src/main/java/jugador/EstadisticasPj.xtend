package jugador 

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class EstadisticasPj {
	
	//Nombre del personaje
	String nombre
	 
	Integer duelosIniciados
	Integer duelosGanados
	Integer duelosGanadosNoIniciados
	Integer derrotasNoIniciadas
	Integer duelosEmpatados
	
	//Posiciones de los duelos iniciados por el jugador
	ArrayList<String> posicionesUsadas
	
	//Posicion de la ultima victoria obtenida en un duelo iniciado
	String mejorUbicacion
	
	//Ultima calificacion obtenida en un duelo iniciado por el jugador
	Integer calificacion
	
	
	def Integer puntaje(){
		calificacion
	}
	
	
	
}