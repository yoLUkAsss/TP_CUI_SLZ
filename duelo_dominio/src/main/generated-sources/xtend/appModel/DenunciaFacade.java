package appModel;

import appModel.Resultado;
import appModel.ResultadoNegativo;
import appModel.ResultadoPositivo;
import com.google.common.base.Objects;
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
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.ObservableUtils;
import org.uqbar.commons.model.UserException;
import org.uqbar.commons.utils.TransactionalAndObservable;

@TransactionalAndObservable
@Accessors
@SuppressWarnings("all")
public class DenunciaFacade {
  private Jugador from;
  
  private Jugador to;
  
  private Denuncia denuncia;
  
  public DenunciaFacade(final Jugador from, final Jugador to) {
    this.from = from;
    this.to = to;
  }
  
  public boolean isPuedeJugar() {
    boolean _and = false;
    String _motivo = this.denuncia.getMotivo();
    boolean _notEquals = (!Objects.equal(_motivo, null));
    if (!_notEquals) {
      _and = false;
    } else {
      String _descripcion = this.denuncia.getDescripcion();
      boolean _equals = _descripcion.equals(" ");
      boolean _not = (!_equals);
      _and = _not;
    }
    return _and;
  }
  
  public Resultado hacerDenuncia() {
    try {
      boolean _denunciaValida = this.denunciaValida();
      if (_denunciaValida) {
        this.to.addDenuncia(this.denuncia);
        return new ResultadoPositivo(this.to);
      } else {
        Denuncia _abusoDelSistema = this.abusoDelSistema();
        this.from.addDenuncia(_abusoDelSistema);
        return new ResultadoNegativo(this.from);
      }
    } catch (final Throwable _t) {
      if (_t instanceof NullPointerException) {
        final NullPointerException e = (NullPointerException)_t;
        throw new UserException("Debe seleccionar un motivo");
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  public void setDenuncia(final Denuncia d) {
    this.denuncia = d;
    boolean _isPuedeJugar = this.isPuedeJugar();
    ObservableUtils.firePropertyChanged(this, "puedeJugar", Boolean.valueOf(_isPuedeJugar));
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
    String _descripcion = this.denuncia.getDescripcion();
    final String[] arr = _descripcion.split(" ");
    boolean _or = false;
    int _length = arr.length;
    boolean _greaterThan = (_length > 3);
    if (_greaterThan) {
      _or = true;
    } else {
      Integer _sizeDescripcion = this.denuncia.sizeDescripcion();
      boolean _greaterEqualsThan = ((_sizeDescripcion).intValue() >= 20);
      _or = _greaterEqualsThan;
    }
    return _or;
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
}
