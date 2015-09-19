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
	String posIdeal
	
	new(String nombre,String pos) {
		this.nombre=nombre
		this.posIdeal = pos
		this.debilidad = "Alto gato"
		this.especialidad = "NO SE"
	}
	
}
