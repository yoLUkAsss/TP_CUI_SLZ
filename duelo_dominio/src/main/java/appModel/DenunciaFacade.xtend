package appModel

import denuncias.DAbusoDeHabilidad
import denuncias.DAbusoDeLenguaje
import denuncias.DAbusoDelSisDeDenuncias
import denuncias.DFeedIntencional
import denuncias.Denuncia
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable

import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.UserException
import util.ResultadoPositivo
import util.ResultadoNegativo

@TransactionalAndObservable
@Accessors
class DenunciaFacade {
	 
	Jugador from
	Jugador to
	Denuncia denuncia
	
	new(Jugador from,Jugador to){
		this.from=from
		this.to = to
	}
	

	def isPuedeJugar(){
		denuncia.motivo != null && !denuncia.descripcion.equals(" ")
	}
		
	def hacerDenuncia(){
		try{
			if(this.denunciaValida()){
				to.addDenuncia(denuncia);
				return new ResultadoPositivo(to);
			}else{
				from.addDenuncia(this.abusoDelSistema());
				return new ResultadoNegativo(from)
			}
		
		}catch(NullPointerException e){
			throw new UserException("Debe seleccionar un motivo")
		}
		
	} 
	
	def setDenuncia(Denuncia d){
		
		denuncia = d;
		firePropertyChanged(this,"puedeJugar",puedeJugar)
	}
	
	def Denuncia abusoDelSistema() {
		return new DAbusoDelSisDeDenuncias('''El Jugador «from.nombre» intenta denunciar a «to.nombre» por: «denuncia.motivo»''')
	}
	
	def denunciaValida() {
		val arr = denuncia.descripcion.split(" ") 
		
		return arr.length>3 || denuncia.sizeDescripcion()>=20
	}
	
	
	
	def getMotivosPosibles(){
		#[new DAbusoDeHabilidad(""),new DAbusoDeLenguaje(""),new DFeedIntencional("")]
	}
	
	
	
	
}