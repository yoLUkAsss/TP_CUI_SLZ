package DueloControllers

import appModel.LobbyAppModel
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import javax.naming.AuthenticationException
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.XTRest
import util.Login
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Get

import jugador.Jugador
import java.util.List
import jugador.Personaje
import excepciones.NoHayRivalException
import excepciones.NoEstaAutenticadoException

import util.SeleccionesDelJugador

@Controller
class DueloController {
	extension JSONUtils = new JSONUtils
	
	@Post("/login")
	def Result login(@Body String login){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			
			var data = login.fromJson(Login)
			var instance = LobbyAppModel.getInstance()
			var jugador = instance.autentificar(data)
			ok('''{ "id" : "«jugador.nombre»" }''')
			
		
		}catch(AuthenticationException e){
			badRequest(''' { "descripcion" : "«e.message»" }''')
		
		}
	}
	
	@Get("/datosDelJuego/:idUsuario")
	def Result datosDelJuego(){
		response.contentType = ContentType.APPLICATION_JSON
		var instance = LobbyAppModel.getInstance()
		if(instance.estaAutenticado(idUsuario)){
			var datosJuego = new DatosPersonajesJson(instance.jugador.nombre,instance.estadisticas,instance.posiciones)
			//ok('''"personajes":«datosJuego.estadisticasDePersonaje.toJson»''')
			ok('''{"id":"«datosJuego.id»", "personajes":«datosJuego.estadisticasDePersonaje.toJson»,"posiciones":"«datosJuego.posiciones»"}''')
		}else{
			badRequest('''{"descripcion":"No esta autenticado"}''')
		}
	}
	
	@Post("/resultado/")
	def Result informacionDelDuelo(@Body String seleccionesDelJugador ) {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			var data=seleccionesDelJugador.fromJson(SeleccionesDelJugador)
			var resultado = LobbyAppModel.getInstance().iniciarDuelo(data.posicionJugador)
			var respuesta = new ResultadoComun(resultado)
			ok('''{"informacionDelRetador":"«respuesta.informacionDelRetador»
			", "informacionDelRival":«respuesta.informacionDelRival»
			", "resultadoDuelo":«respuesta.resultadoDuelo»"}''')
		} catch (NoHayRivalException e) {
			badRequest('''{"descripcion":"No Hay Rival"}''')
		}
	}
	
	@Post("/resultado/")
	def Result informacionDelDueloConElRobot(@Body String seleccionesDelJugador){
	    response.contentType = ContentType.APPLICATION_JSON
	    var data=seleccionesDelJugador.fromJson(SeleccionesDelJugador)
	    var resultado= LobbyAppModel.getInstance().iniciarDueloBot(data.posicionJugador)
	    var respuesta = new ResultadoComun(resultado)
			ok('''{"informacionDelRetador":"«respuesta.informacionDelRetador»
			", "informacionDelRival":«respuesta.informacionDelRival»
			", "resultadoDuelo":«respuesta.resultadoDuelo»"}''')
	    
	}
	
	def sinLlaves(String string) {
		string.substring(1,string.length()-1)
	}
	
	
	
	def static void main(String[] args) {
		XTRest.start(DueloController, 9000)
	}
	
}