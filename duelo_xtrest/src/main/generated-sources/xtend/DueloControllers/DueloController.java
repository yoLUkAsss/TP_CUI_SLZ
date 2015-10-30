package DueloControllers;

import DueloControllers.DatosPersonajesJson;
import appModel.LobbyAppModel;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.AuthenticationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jugador.EstadisticaDePersonaje;
import jugador.Jugador;
import jugador.Posicion;
import org.eclipse.jetty.server.Request;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Extension;
import org.uqbar.xtrest.api.Result;
import org.uqbar.xtrest.api.XTRest;
import org.uqbar.xtrest.api.annotation.Body;
import org.uqbar.xtrest.api.annotation.Controller;
import org.uqbar.xtrest.api.annotation.Get;
import org.uqbar.xtrest.api.annotation.Post;
import org.uqbar.xtrest.http.ContentType;
import org.uqbar.xtrest.json.JSONUtils;
import org.uqbar.xtrest.result.ResultFactory;
import util.Login;

@Controller
@SuppressWarnings("all")
public class DueloController extends ResultFactory {
  @Extension
  private JSONUtils _jSONUtils = new JSONUtils();
  
  @Post("/login")
  public Result login(@Body final String login, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    Result _xblockexpression = null;
    {
      response.setContentType(ContentType.APPLICATION_JSON);
      Result _xtrycatchfinallyexpression = null;
      try {
        Result _xblockexpression_1 = null;
        {
          Login data = this._jSONUtils.<Login>fromJson(login, Login.class);
          LobbyAppModel instance = LobbyAppModel.getInstance();
          Jugador jugador = instance.autentificar(data);
          StringConcatenation _builder = new StringConcatenation();
          _builder.append("{ \"id\" : \"");
          String _nombre = jugador.getNombre();
          _builder.append(_nombre, "");
          _builder.append("\" }");
          _xblockexpression_1 = ResultFactory.ok(_builder.toString());
        }
        _xtrycatchfinallyexpression = _xblockexpression_1;
      } catch (final Throwable _t) {
        if (_t instanceof AuthenticationException) {
          final AuthenticationException e = (AuthenticationException)_t;
          StringConcatenation _builder = new StringConcatenation();
          _builder.append(" ");
          _builder.append("{ \"descripcion\" : \"");
          String _message = e.getMessage();
          _builder.append(_message, " ");
          _builder.append("\" }");
          _xtrycatchfinallyexpression = ResultFactory.badRequest(_builder.toString());
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      _xblockexpression = _xtrycatchfinallyexpression;
    }
    return _xblockexpression;
  }
  
  @Get("/datosDelJuego/:idUsuario")
  public Result datosDelJuego(final String idUsuario, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    Result _xblockexpression = null;
    {
      response.setContentType(ContentType.APPLICATION_JSON);
      LobbyAppModel instance = LobbyAppModel.getInstance();
      Result _xifexpression = null;
      boolean _estaAutenticado = instance.estaAutenticado(idUsuario);
      if (_estaAutenticado) {
        Result _xblockexpression_1 = null;
        {
          Jugador _jugador = instance.getJugador();
          String _nombre = _jugador.getNombre();
          List<EstadisticaDePersonaje> _estadisticas = instance.getEstadisticas();
          List<Posicion> _posiciones = instance.getPosiciones();
          DatosPersonajesJson datosJuego = new DatosPersonajesJson(_nombre, _estadisticas, _posiciones);
          StringConcatenation _builder = new StringConcatenation();
          _builder.append("{\"id\":\"");
          String _id = datosJuego.getId();
          _builder.append(_id, "");
          _builder.append("\", \"personajes\":");
          List<EstadisticaDePersonaje> _estadisticasDePersonaje = datosJuego.getEstadisticasDePersonaje();
          String _json = this._jSONUtils.toJson(_estadisticasDePersonaje);
          _builder.append(_json, "");
          _builder.append(",\"posiciones\":\"");
          List<Posicion> _posiciones_1 = datosJuego.getPosiciones();
          _builder.append(_posiciones_1, "");
          _builder.append("\"}");
          _xblockexpression_1 = ResultFactory.ok(_builder.toString());
        }
        _xifexpression = _xblockexpression_1;
      } else {
        StringConcatenation _builder = new StringConcatenation();
        _builder.append("{\"descripcion\":\"No esta autenticado\"}");
        _xifexpression = ResultFactory.badRequest(_builder.toString());
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public String sinLlaves(final String string) {
    int _length = string.length();
    int _minus = (_length - 1);
    return string.substring(1, _minus);
  }
  
  public static void main(final String[] args) {
    XTRest.start(DueloController.class, 9000);
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    {
    	Matcher matcher = 
    		Pattern.compile("/datosDelJuego/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String idUsuario = matcher.group(1);
    		
    		
    	    Result result = datosDelJuego(idUsuario, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/login").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String login = readBodyAsString(request);
    		
    		// take variables from url
    		
    		
    	    Result result = login(login, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    this.pageNotFound(baseRequest, request, response);
  }
  
  public void pageNotFound(final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    response.getWriter().write(
    	"<html><head><title>XtRest - Page Not Found!</title></head>" 
    	+ "<body>"
    	+ "	<h1>Page Not Found !</h1>"
    	+ "	Supported resources:"
    	+ "	<table>"
    	+ "		<thead><tr><th>Verb</th><th>URL</th><th>Parameters</th></tr></thead>"
    	+ "		<tbody>"
    	+ "			<tr>"
    	+ "				<td>GET</td>"
    	+ "				<td>/datosDelJuego/:idUsuario</td>"
    	+ "				<td>idUsuario</td>"
    	+ "			</tr>"
    	+ "			<tr>"
    	+ "				<td>POST</td>"
    	+ "				<td>/login</td>"
    	+ "				<td>login</td>"
    	+ "			</tr>"
    	+ "		</tbody>"
    	+ "	</table>"
    	+ "</body>"
    );
    response.setStatus(404);
    baseRequest.setHandled(true);
  }
}
