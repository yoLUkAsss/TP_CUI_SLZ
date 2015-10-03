package jugador 
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class EstadisticaDePersonaje implements Comparable<EstadisticaDePersonaje> {
	
	//Nombre del personaje
	Personaje personajeAsociado
	 
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
	TipoCalificacion calificacion
	
	
	new (Personaje personaje) {
		this.personajeAsociado = personaje
		duelosIniciados=0
		duelosGanados=0
		duelosGanadosNoIniciados=0
		derrotasNoIniciadas=0
		duelosEmpatados=0
		mejorUbicacion=Posicion.NONE
		posicionesUsadas=newArrayList		
		calificacion=TipoCalificacion.NOOB
	}
		

	
	def ganoComoRetador(Posicion pos) {
		duelosIniciados = duelosIniciados +1
		duelosGanados = duelosGanados + 1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos;
		firePropertyChanged(this,"duelosIniciado",duelosIniciados)
		firePropertyChanged(this,"duelosGanados",duelosGanados)
		firePropertyChanged(this,"posicionesUsadas",posicionesUsadas)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
	}
	
	def perdioComoRetador(Posicion pos) {
		duelosIniciados = duelosIniciados +1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"posicionesUsadas",posicionesUsadas)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
	}
	
	def ganoComoRival(Posicion pos) {
		duelosGanados = duelosGanados +1
		duelosGanadosNoIniciados = duelosGanadosNoIniciados +1
		firePropertyChanged(this,"duelosGanados",duelosGanados)
		firePropertyChanged(this,"duelosGanadosNoIniciados",duelosGanadosNoIniciados)
	}
	
	def perdioComoRival(Posicion pos) {
		derrotasNoIniciadas = derrotasNoIniciadas +1
		firePropertyChanged(this,"derrotasNoIniciadas",derrotasNoIniciadas)
	}
	
	def empatoComoRetador(Posicion pos) {
		duelosIniciados = duelosIniciados +1
		duelosEmpatados = duelosEmpatados + 1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
	}
	
	def empatoComoRival(Posicion pos)  {
		duelosEmpatados = duelosEmpatados +1
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
	}
	
	def setCalificacion (TipoCalificacion t) {
		this.calificacion = t
		firePropertyChanged(this,"calificacion",calificacion)
	}
	
	//Retorna cuantas veces lo utilizo en la posicion indicada
	def posicionesUsadas(Posicion posicion) {
		(this.posicionesUsadas.filter[each | each.equals(posicion)]).size
	}

	def esDeEstePersonaje (Personaje personajeAEvaluar) {
		return this.personajeAsociado.equals(personajeAEvaluar)
	}
	
	def getNombreDelPersonaje() {
		return personajeAsociado.nombre
	}
	
	override compareTo(EstadisticaDePersonaje otraEstadistica) {
		this.personajeAsociado.compareTo(otraEstadistica.personajeAsociado)
	}
}
