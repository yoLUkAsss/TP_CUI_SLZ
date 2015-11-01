package jugador 
 
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
/**
 * 
 * Abstraccion de una estadistica general de un personaje particular. 
 * En el se guardan, el personaje, datos globales de futuros encuentros,
 * una coleccion de posiciones, la mejor ubicacion, y la ultima calificacion obtenida.
 * 
 * @author Sandoval Lucas
 * @author Nicolas Leutwyler
 * @author Zaracho Rosali
 * 
 */
class EstadisticaDePersonaje implements Comparable<EstadisticaDePersonaje> {
	
	//Nombre del personaje
	Personaje personajeAsociado
	
	//Datos globales 
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
		

	/**
	 * Actualiza datos de acuerdo a la victoria como retador
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
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
	
	/**
	 * Actualiza datos de acuerdo a la derrota como retador
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
	def perdioComoRetador(Posicion pos) {
		duelosIniciados = duelosIniciados +1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"posicionesUsadas",posicionesUsadas)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
	}
	
	/**
	 * Actualiza datos de acuerdo a la victoria como rival
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
	def ganoComoRival(Posicion pos) {
		duelosGanados = duelosGanados +1
		duelosGanadosNoIniciados = duelosGanadosNoIniciados +1
		firePropertyChanged(this,"duelosGanados",duelosGanados)
		firePropertyChanged(this,"duelosGanadosNoIniciados",duelosGanadosNoIniciados)
	}
	
	/**
	 * Actualiza datos de acuerdo a la derrota como rival
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
	def perdioComoRival(Posicion pos) {
		derrotasNoIniciadas = derrotasNoIniciadas +1
		firePropertyChanged(this,"derrotasNoIniciadas",derrotasNoIniciadas)
	}
	
	/**
	 * Actualiza datos de acuerdo al empate obtenido como retador
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
	def empatoComoRetador(Posicion pos) {
		duelosIniciados = duelosIniciados +1
		duelosEmpatados = duelosEmpatados + 1
		posicionesUsadas.add(pos)
		mejorUbicacion = pos
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
		firePropertyChanged(this,"duelosIniciados",duelosIniciados)
		firePropertyChanged(this,"mejorUbicacion",mejorUbicacion)
	}
	
	/**
	 * Actualiza datos de acuerdo al empate obtenido como rival
	 * 
	 * @param pos Posicion utilizada en dicho combate
	 * 
	 */
	def empatoComoRival(Posicion pos)  {
		duelosEmpatados = duelosEmpatados +1
		firePropertyChanged(this,"duelosEmpatados",duelosEmpatados)
	}
	
	/**
	 * Actualiza la calificacion
	 * 
	 * @param tipo Calificacion a actualizar
	 * 
	 */
	def setCalificacion (TipoCalificacion tipo) {
		this.calificacion = tipo
		firePropertyChanged(this,"calificacion",calificacion)
	}
	
	
	/**
	 * Cantidad de veces que duelio en una posicion
	 * 
	 * @param posicion Posicion de la busqueda
	 * 
	 * @return La cantidad de veces que utilizo posicion para combatir
	 */
	def posicionesUsadas(Posicion posicion) {
		(this.posicionesUsadas.filter[each | each.equals(posicion)]).size
	}

	/**
	 * Indica si la estadistica se corresponde a un personaje en particular
	 * 
	 * @param personajeAEvaluar personaje identificatorio
	 * 
	 * @return True en caso de que sea el personaje valido, false caso contrario
	 */
	def esDeEstePersonaje (Personaje personajeAEvaluar) {
		return this.personajeAsociado.equals(personajeAEvaluar)
	}
	
	/**
	 * @return Nombre del personaje asociado
	 */
	def getNombreDelPersonaje() {
		return personajeAsociado.nombre
	}
	
	override compareTo(EstadisticaDePersonaje otraEstadistica) {
		this.personajeAsociado.compareTo(otraEstadistica.personajeAsociado)
	}
}
