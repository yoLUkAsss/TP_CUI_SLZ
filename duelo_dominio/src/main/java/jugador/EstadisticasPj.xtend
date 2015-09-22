package jugador 
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

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
		duelosIniciados = duelosIniciados +1
		duelosGanados = duelosGanados + 1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos;
		calificacion = nuevaCalificacion
		firePropertyChanged(this,"duelosIniciado",duelosIniciados)
		firePropertyChanged(this,"duelosGanados",duelosGanados)
		firePropertyChanged(this,"posicionesUsadas",posicionesUsadas)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
		firePropertyChanged(this,"calificacion",calificacion)
	}
	
	def perdioComoRetador(Posicion pos , Integer nuevaCalificacion) {
		duelosIniciados = duelosIniciados +1
		posicionesUsadas.add(pos)
		calificacion = nuevaCalificacion
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"posicionesUsadas",posicionesUsadas)
		firePropertyChanged(this,"calificacion",calificacion)
	}
	
	def ganoComoRival(Posicion pos , Integer nuevaCalificacion) {
		duelosGanados = duelosGanados +1
		duelosGanadosNoIniciados = duelosGanadosNoIniciados +1
		firePropertyChanged(this,"duelosGanados",duelosGanados)
		firePropertyChanged(this,"duelosGanadosNoIniciados",duelosGanadosNoIniciados)
	}
	
	def perdioComoRival(Posicion pos , Integer nuevaCalificacion) {
		derrotasNoIniciadas = derrotasNoIniciadas +1
		firePropertyChanged(this,"derrotasNoIniciadas",derrotasNoIniciadas)
	}
	
	def empatoComoRetador(Posicion pos , Integer nuevaCalificacion) {
		duelosIniciados = duelosIniciados +1
		duelosEmpatados = duelosEmpatados + 1
		calificacion = nuevaCalificacion
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"calificacion",calificacion)
	}
	
	def empatoComoRival(Posicion pos , Integer nuevaCalificacion) {
		duelosEmpatados = duelosEmpatados +1
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
	}

}
