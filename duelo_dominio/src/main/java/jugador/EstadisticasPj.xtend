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
	
	
	new (String nombre) {
		this.nombre=nombre
		duelosIniciados=0
		duelosGanados=0
		duelosGanadosNoIniciados=0
		derrotasNoIniciadas=0
		duelosEmpatados=0
		posicionesUsadas=newArrayList		
		calificacion=0
	}
		
	def Integer puntaje(){
		calificacion
	}
	
	
	
}
