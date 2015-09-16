package appModel;

import appModel.Resultado;
import jugador.Jugador;
import org.eclipse.xtend2.lib.StringConcatenation;

@SuppressWarnings("all")
public class ResultadoNegativo extends Resultado {
  public ResultadoNegativo(final Jugador j) {
    super(j);
  }
  
  public String getTitle() {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("Has sido sancionado: ");
    String _nombre = this.j.getNombre();
    _builder.append(_nombre, "");
    return _builder.toString();
  }
  
  public String getDescription() {
    return "Hemos detectado que tu denuncia no tiene fundamentos solidos.\nEn duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play. \nCon lo que has recibido una sancion por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud";
  }
}
