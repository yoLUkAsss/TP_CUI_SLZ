package util

import org.eclipse.xtend.lib.annotations.Accessors
import jugador.Jugador

@Accessors
class Login {
	String usuario;
	String password;
	
	new(String usuario,String password){
		this.usuario=usuario
		this.password=password
	}
	
	new(){}
	
	def matches(Jugador jugador) {
		return jugador.identifies(usuario,password)
	}
	
}