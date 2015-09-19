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
	Collection<Posicion> posicionesUsadas
	
	//Posicion de la ultima victoria obtenida en un duelo iniciado
	Posicion mejorUbicacion
	
	//Ultima calificacion obtenida en un duelo iniciado por el jugador
	Integer calificacion
	
	
	new (String nombre) {
		this.nombre=nombre
		duelosIniciados=0
		duelosGanados=0
		duelosGanadosNoIniciados=0
		derrotasNoIniciadas=0
		duelosEmpatados=0
		mejorUbicacion=Posicion.NONE
		posicionesUsadas=newArrayList		
		calificacion=0
	}
		
	def Integer puntaje(){
		calificacion
	}
	
	def ganoComoRetador(Posicion pos , Integer nuevaCalificacion) {
		duelosIniciados++
		duelosGanados++
		posicionesUsadas.add(pos)
		mejorUbicacion = pos;
		calificacion = nuevaCalificacion
	}
	
	def perdioComoRetador(Posicion pos , Integer nuevaCalificacion) {
		duelosIniciados++
		posicionesUsadas.add(pos)
		calificacion = nuevaCalificacion
	}
	
	def ganoComoRival(Posicion pos , Integer nuevaCalificacion) {
		duelosGanados++
		duelosGanadosNoIniciados++
	}
	
	def perdioComoRival(Posicion pos , Integer nuevaCalificacion) {
		derrotasNoIniciadas++
	}
	
	def empato() {
		duelosEmpatados++
	}

}
