package jugador

import jugador.Denuncia

class DAbusoDeHabilidad extends Denuncia {
	
	new(String descripcion) {
		super(descripcion)
	}
	
	override getPeso() {
		return 5
	}
	
	override getMotivo() {
		return "Abuso de habilidad"
	}
	
}