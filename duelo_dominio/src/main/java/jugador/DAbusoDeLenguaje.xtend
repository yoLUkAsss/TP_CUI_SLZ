package jugador

import jugador.Denuncia

class DAbusoDeLenguaje extends Denuncia {
	
	new(String descripcion) {
		super(descripcion)
	}
	
	override getPeso() {
		return 7;
	}
	
	override getMotivo() {
		return "Abuso del lenguaje"
	}
	
}