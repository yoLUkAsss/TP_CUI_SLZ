package denuncias

import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.utils.Observable


import static org.uqbar.commons.model.ObservableUtils.*
@Observable
@Accessors
abstract class Denuncia {
	
	String descripcion;
	
	new(String descripcion){
		this.descripcion=descripcion;
	}
	

	
	def Integer sizeDescripcion(){
		return this.descripcion.length();
	}
	
	def abstract Integer getPeso();
	
	def abstract String getMotivo();
	
	
	
}