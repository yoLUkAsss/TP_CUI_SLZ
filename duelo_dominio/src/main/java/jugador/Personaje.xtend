package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

//firepropertychange()

@Observable
@Accessors
class Personaje implements Comparable<Personaje> { 
	
	String nombre
	List<String> especialidades
	List<String> debilidades
	Posicion posicionIdeal
	
	new(String nombre,Posicion pos) {
		this.nombre=nombre
		this.posicionIdeal = pos
		especialidades = newArrayList
		debilidades = newArrayList
	}
	
	override equals(Object o) {
		if (o != null && o instanceof Personaje){
			var Personaje p = o as Personaje
			return p.nombre.equals(this.nombre)
		}
		return false
	}
	
	//Determina si la posicion es la posicion ideal del personaje
	def mejorPosicion(Posicion posicion) {
		this.posicionIdeal.equals(posicion)	
	}
	
	override compareTo(Personaje otroPersonaje) {
		return this.nombre.compareTo(otroPersonaje.nombre)
	}
	
	def agregarNuevaDebilidad (String nuevaDebilidad) {
		this.debilidades.add(nuevaDebilidad)
	}
	
	def agregarNuevaFortaleza (String nuevaEspecialidad) {
		this.especialidades.add(nuevaEspecialidad)
	}
	
	override toString() {
		return this.nombre
	}
	
}
