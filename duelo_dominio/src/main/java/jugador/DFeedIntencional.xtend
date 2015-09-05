package jugador

import jugador.Denuncia

class DFeedIntencional extends Denuncia {
	
	new(String descripcion) {
		super(descripcion)
	}
	
	override getPeso() {
		return 10;
	}
	
	override getMotivo() {
		return "Feed Intencional"
	}
	
}