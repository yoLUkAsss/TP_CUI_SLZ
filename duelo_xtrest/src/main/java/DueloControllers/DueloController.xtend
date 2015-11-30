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
import util.DatosPersonajesJson
import util.ResultadoComun
import util.mobile.UltimaEstadisticaMobile

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
	
	@Get("/logout/:idUsuario")
	def Result logout(){
		try{
			var instance = LobbyAppModel.getInstance()
			instance.salir(idUsuario)
			ok('''{"descripcion":"Esperamos la haya pasado bien! Vuelva prontos!"}''')
		}catch(NoEstaAutenticadoException e){
			badRequest(''' { "descripcion" : "«e.message»" }''')
		}
	}
	
	@Get("/datosDelJuego/:idUsuario")
	def Result datosDelJuego(){
		response.contentType = ContentType.APPLICATION_JSON
		var instance = LobbyAppModel.getInstance()
		if(instance.estaAutenticado(idUsuario)){
			var datosJuego = new DatosPersonajesJson(instance.jugador.nombre,instance.estadisticas,instance.posiciones)
			ok('''{"id":"«datosJuego.id»", "estadisticaPorPersonajes":«datosJuego.estadisticasDePersonaje.toJson»,"posiciones":«datosJuego.posiciones.toJson»}''')
		}else{
			badRequest('''{"descripcion":"No esta autenticado"}''')
		}
	}
	
	@Post("/resultado")
	def Result informacionDelDuelo(@Body String seleccionesDelJugador ) {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			var data=seleccionesDelJugador.fromJson(SeleccionesDelJugador)
			var resultado = LobbyAppModel.getInstance().iniciarDueloConPersonaje(data.posicionJugador,data.idPersonajeJugador)
			var respuesta = new ResultadoComun(resultado)
			ok('''{"informacionDelRetador":«respuesta.informacionDelRetador.toJson»,"informacionDelRival":«respuesta.informacionDelRival.toJson»,"resultadoDuelo":«respuesta.resultadoDuelo.toJson»}''')
		} catch (NoHayRivalException e) {
			badRequest('''{"descripcion":"«e.message»"}''')
		}
	}
	
	@Post("/noRival")
	def Result informacionDelDueloBot(@Body String seleccionesDelJugador){
	    response.contentType = ContentType.APPLICATION_JSON
	    try {
		    var data=seleccionesDelJugador.fromJson(SeleccionesDelJugador)
		    var resultado= LobbyAppModel.getInstance().iniciarDueloBotConPersonaje(data.posicionJugador,data.idPersonajeJugador)
		    var respuesta = new ResultadoComun(resultado)
			ok('''{"informacionDelRetador":«respuesta.informacionDelRetador.toJson», "informacionDelRival":«respuesta.informacionDelRival.toJson», "resultadoDuelo":«respuesta.resultadoDuelo.toJson»}''')
	    } catch (Exception e){
	    	e.printStackTrace
	    	badRequest('''{"descripcion":"«e.message»"}''')
	    }
	}
	
	
	/////////////////
	//DUELO ANDROID//
	/////////////////
	
	@Get("/datosDelJuegoMobile/:idUsuario")
	def Result datosDelJuegoMobile(){
		response.contentType = ContentType.APPLICATION_JSON
		var instance = LobbyAppModel.getInstance()
		if(instance.estaAutenticado(idUsuario)){
			var datosJuego = instance.personajesTotales.map[each | each.toString]
			ok('''{"personajesTotales":«datosJuego.toJson»}''')
		}else{
			badRequest('''{"descripcion":"No esta autenticado"}''')
		}
	}
	
	@Get("/detallePersonajeMobile/:idPersonaje")
	def Result detallePersonajeMobile(){
		response.contentType = ContentType.APPLICATION_JSON
		var instance = LobbyAppModel.getInstance()
		var personajeAEnviar = instance.personajesTotales.findFirst[personaje | personaje.nombre.equals(idPersonaje)]
		if (personajeAEnviar != null)	
			ok('''«personajeAEnviar.toJson»''')
		else
			badRequest('''{"descripcion":"Personaje No Valido"}''')
	}
	
	@Get("/estadisticaPersonajeMobile/:idPersonaje")
	def Result estadisticaPersonajeMobile(){
		response.contentType = ContentType.APPLICATION_JSON
		var instance = LobbyAppModel.getInstance()
		try {
			var estadistica = instance.estadisticas.findFirst[each | each.personajeAsociado.nombre.equals(idPersonaje)]
			var datosAEnviar = new UltimaEstadisticaMobile(estadistica)
			ok('''«datosAEnviar.toJson»''')
		}
		catch (Exception e) {
			e.printStackTrace
			badRequest('''{"descripcion":«e.message»}''')	
		}
	}
	
	def static void main(String[] args) {
		XTRest.start(DueloController, 9000)
	}
	
}
