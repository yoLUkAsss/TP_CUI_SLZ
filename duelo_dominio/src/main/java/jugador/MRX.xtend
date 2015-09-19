package jugador

import denuncias.Denuncia

class MRX extends Jugador {
	
	Jugador j
	
	new(String nombre, Jugador jugador) {
		super(nombre)
		this.j=jugador
	}
	
	override ranking(){
		j.totPeso(denuncias)*j.cantPeleasGanadas(est)
	}
	
	override getNombre(){
		"MR-X"
	}
	override setNombre(String s){
		//NOTHING
	}
	
	override getEst() {
		return j.est
	}
	override getDenuncias() {
		return j.denuncias
	}
	override addDenuncia(Denuncia d) {
		//Nothing
	}
	
}