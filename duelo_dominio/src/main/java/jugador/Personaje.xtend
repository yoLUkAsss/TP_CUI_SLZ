package jugador

import org.eclipse.xtend.lib.annotations.Accessors
 
//firepropertychange()

@Accessors
class Personaje { 
	
	String nombre
	String especialidad
	String debilidad
	String posIdeal
	
	new(String nombre,String pos) {
		this.nombre=nombre
		this.posIdeal = pos
	}
	
	override equals(Object o) {
		if (o != null && o instanceof Personaje){
			var Personaje p = o as Personaje
			return p.nombre.equals(this.nombre)
		}
		return false
	}
	
	
}
