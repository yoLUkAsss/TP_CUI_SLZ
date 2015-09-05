package jugador

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Denuncia {
	
	private String descripcion;
	
	new(String descripcion){
		this.descripcion=descripcion;
	}
	
	def Integer sizeDescripcion(){
		return this.descripcion.length();
	}
	
	def abstract Integer getPeso();
	
	def abstract String getMotivo();
	
	
	
}