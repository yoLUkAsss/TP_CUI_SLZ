package appModel;

import appModel.Resultado;
import jugador.Jugador;
import org.eclipse.xtend2.lib.StringConcatenation;

@SuppressWarnings("all")
public class ResultadoPositivo extends Resultado {
  public ResultadoPositivo(final Jugador j) {
    super(j);
  }
  
  public String getTitle() {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("Hemos sancionado a: ");
    String _nombre = this.j.getNombre();
    _builder.append(_nombre, "");
    return _builder.toString();
  }
  
  public String getDescription() {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("En Duelo de Leyendas somos partidarios del fair play.\\n Gracias por ayudarnos a mantenernos asi");
    return _builder.toString();
  }
}
