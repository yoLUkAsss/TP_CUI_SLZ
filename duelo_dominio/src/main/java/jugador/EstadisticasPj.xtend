package jugador 
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import org.uqbar.commons.utils.Observable

@Observable
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
	Collection<String> posicionesUsadas
	
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
		mejorUbicacion=" - ";
		posicionesUsadas=newArrayList		
		calificacion=0
	}
		
	def Integer puntaje(){
		calificacion
	}
	
	def ganoComoRetador(String pos , Integer nuevaCalificacion) {
		duelosIniciados++
		duelosGanados++
		posicionesUsadas.add(pos)
		mejorUbicacion = pos;
		calificacion = nuevaCalificacion
	}
	
	def perdioComoRetador(String pos , Integer nuevaCalificacion) {
		duelosIniciados++
		posicionesUsadas.add(pos)
		calificacion = nuevaCalificacion
	}
	
	def ganoComoRival(String pos , Integer nuevaCalificacion) {
		duelosGanados++
		duelosGanadosNoIniciados++
	}
	
	def perdioComoRival(String pos , Integer nuevaCalificacion) {
		derrotasNoIniciadas++
	}
	
	def empato() {
		duelosEmpatados++
	}

}
