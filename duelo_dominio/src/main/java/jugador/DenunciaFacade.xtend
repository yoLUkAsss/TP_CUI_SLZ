package jugador

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DenunciaFacade {
	
	Jugador from
	Jugador to
	Denuncia d
	
	def hacerDenuncia(){
		
		if(this.denunciaValida()){
			to.addDenuncia(d);
		}else{
			from.addDenuncia(this.abusoDelSistema());
		}
		
	}
	
	def Denuncia abusoDelSistema() {
		return new DAbusoDelSisDeDenuncias("El Jugador " +from.nombre
			 + "intenta denunciar a " + to.nombre + "por: " + d.getMotivo());
	}
	
	def denunciaValida() {
		return d.sizeDescripcion()<=3;
	}
	
	
	
	
}