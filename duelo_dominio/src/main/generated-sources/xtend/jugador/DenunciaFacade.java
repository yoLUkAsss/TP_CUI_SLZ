package jugador;

import jugador.DAbusoDelSisDeDenuncias;
import jugador.Denuncia;
import jugador.Jugador;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DenunciaFacade {
  private Jugador from;
  
  private Jugador to;
  
  private Denuncia d;
  
  public boolean hacerDenuncia() {
    boolean _xifexpression = false;
    boolean _denunciaValida = this.denunciaValida();
    if (_denunciaValida) {
      _xifexpression = this.to.addDenuncia(this.d);
    } else {
      Denuncia _abusoDelSistema = this.abusoDelSistema();
      _xifexpression = this.from.addDenuncia(_abusoDelSistema);
    }
    return _xifexpression;
  }
  
  public Denuncia abusoDelSistema() {
    String _nombre = this.from.getNombre();
    String _plus = ("El Jugador " + _nombre);
    String _plus_1 = (_plus + "intenta denunciar a ");
    String _nombre_1 = this.to.getNombre();
    String _plus_2 = (_plus_1 + _nombre_1);
    String _plus_3 = (_plus_2 + "por: ");
    String _motivo = this.d.getMotivo();
    String _plus_4 = (_plus_3 + _motivo);
    return new DAbusoDelSisDeDenuncias(_plus_4);
  }
  
  public boolean denunciaValida() {
    Integer _sizeDescripcion = this.d.sizeDescripcion();
    return ((_sizeDescripcion).intValue() <= 3);
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
  public Denuncia getD() {
    return this.d;
  }
  
  public void setD(final Denuncia d) {
    this.d = d;
  }
}
