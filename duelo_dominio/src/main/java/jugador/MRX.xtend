package jugador

import denuncias.Denuncia

class MRX extends Jugador {
	
	Jugador jugador
	
	new(String nombre, Jugador jugador) {
		super(nombre)
		this.jugador=jugador
	}
	
	override ranking(){
		jugador.totPeso(denuncias)*jugador.cantPeleasGanadas(est)
	}
	
	override getNombre(){
		"MR-X"
	}
	override setNombre(String s){
		//NOTHING
	}
	
	override getEst() {
		return jugador.est
	}
	override getDenuncias() {
		return jugador.denuncias
	}
	override addDenuncia(Denuncia d) {
		//Nothing
	}
	
}