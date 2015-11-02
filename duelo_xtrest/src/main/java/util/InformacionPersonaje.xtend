package util

import jugador.Personaje
import java.util.List

class InformacionPersonaje {
	String nombre
	String posIdeal
	List<String> especialidades
	List<String> debilidades
	
	new (Personaje personaje) {
		this.nombre = personaje.nombre
		this.posIdeal = personaje.posicionIdeal.toString
		this.especialidades = personaje.especialidades
		this.debilidades = personaje.debilidades
	}
}