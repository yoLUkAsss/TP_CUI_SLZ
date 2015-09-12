package appModel;

import denuncias.DAbusoDeHabilidad;
import denuncias.DAbusoDeLenguaje;
import denuncias.DAbusoDelSisDeDenuncias;
import denuncias.DFeedIntencional;
import denuncias.Denuncia;
import java.util.Collections;
import java.util.List;
import jugador.Jugador;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Observable
@Accessors
@SuppressWarnings("all")
public class DenunciaFacade {
  private Jugador from;
  
  private Jugador to;
  
  private Denuncia denuncia;
  
  public boolean hacerDenuncia() {
    boolean _xifexpression = false;
    boolean _denunciaValida = this.denunciaValida();
    if (_denunciaValida) {
      _xifexpression = this.to.addDenuncia(this.denuncia);
    } else {
      Denuncia _abusoDelSistema = this.abusoDelSistema();
      _xifexpression = this.from.addDenuncia(_abusoDelSistema);
    }
    return _xifexpression;
  }
  
  public Denuncia abusoDelSistema() {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("El Jugador ");
    String _nombre = this.from.getNombre();
    _builder.append(_nombre, "");
    _builder.append(" intenta denunciar a ");
    String _nombre_1 = this.to.getNombre();
    _builder.append(_nombre_1, "");
    _builder.append(" por: ");
    String _motivo = this.denuncia.getMotivo();
    _builder.append(_motivo, "");
    return new DAbusoDelSisDeDenuncias(_builder.toString());
  }
  
  public boolean denunciaValida() {
    Integer _sizeDescripcion = this.denuncia.sizeDescripcion();
    return ((_sizeDescripcion).intValue() <= 3);
  }
  
  public List<? extends Denuncia> getMotivosPosibles() {
    DAbusoDeHabilidad _dAbusoDeHabilidad = new DAbusoDeHabilidad("");
    DAbusoDeLenguaje _dAbusoDeLenguaje = new DAbusoDeLenguaje("");
    DFeedIntencional _dFeedIntencional = new DFeedIntencional("");
    return Collections.<Denuncia>unmodifiableList(CollectionLiterals.<Denuncia>newArrayList(_dAbusoDeHabilidad, _dAbusoDeLenguaje, _dFeedIntencional));
  }
  
  @Pure
  public Jugador getFrom() {
    return this.from;
  }
  
  public void setFrom(final Jugador from) {
    this.from = from;
  }
  
  @Pure
  public Jugador getTo() {
    return this.to;
  }
  
  public void setTo(final Jugador to) {
    this.to = to;
  }
  
  @Pure
  public Denuncia getDenuncia() {
    return this.denuncia;
  }
  
  public void setDenuncia(final Denuncia denuncia) {
    this.denuncia = denuncia;
  }
}
