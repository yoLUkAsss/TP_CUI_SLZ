package jugador

class DAbusoDelSisDeDenuncias extends Denuncia{
	
	new(String descripcion) {
		super(descripcion)
	}
	
	override getPeso() {
		return 25;s
	}
	
	override getMotivo() {
		return "Abuso del sistema de denuncias"
	} 
	
}