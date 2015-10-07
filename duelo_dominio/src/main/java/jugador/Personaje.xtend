package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

//firepropertychange()

@Observable
@Accessors
class Personaje implements Comparable<Personaje> { 
	
	String nombre
	String especialidad
	String debilidad
	Posicion posicionIdeal 
	
	new(String nombre,Posicion pos) {
		this.nombre=nombre
		this.posicionIdeal = pos
		this.debilidad = "Alto gato"
		this.especialidad = "NO SE"
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
	
	
}
