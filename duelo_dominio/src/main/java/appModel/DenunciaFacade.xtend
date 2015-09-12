package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import jugador.Jugador
import denuncias.*

@Observable
@Accessors
class DenunciaFacade {
	
	Jugador from
	Jugador to
	Denuncia denuncia
	
	def hacerDenuncia(){
		
		if(this.denunciaValida()){
			to.addDenuncia(denuncia);
		}else{
			from.addDenuncia(this.abusoDelSistema());
		}
		
	} 
	
	def Denuncia abusoDelSistema() {
		return new DAbusoDelSisDeDenuncias('''El Jugador «from.nombre» intenta denunciar a «to.nombre» por: «denuncia.motivo»''')
	}
	
	def denunciaValida() {
		return denuncia.sizeDescripcion()<=3
	}
	

	
	def getMotivosPosibles(){
		#[new DAbusoDeHabilidad(""),new DAbusoDeLenguaje(""),new DFeedIntencional("")]
	}
	
	
	
	
}