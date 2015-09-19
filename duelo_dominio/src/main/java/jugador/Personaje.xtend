package jugador

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

//firepropertychange()

@Observable
@Accessors
class Personaje { 
	
	String nombre
	String especialidad
	String debilidad
	Posicion posIdeal
	
	new(String nombre,Posicion pos) {
		this.nombre=nombre
		this.posIdeal = pos
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
	
	
}
