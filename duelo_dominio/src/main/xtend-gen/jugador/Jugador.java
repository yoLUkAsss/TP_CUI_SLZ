package jugador;

import java.util.Collection;
import jugador.Denuncia;
import jugador.EstadisticasPj;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Jugador {
  private EstadisticasPj est;
  
  private Collection<Denuncia> denuncias;
  
  public double ranking() {
    return this.avgPeso(this.denuncias);
  }
  
  private double avgPeso(final Collection<Denuncia> denuncias) {
    double avg = 0D;
    for (final Denuncia d : denuncias) {
      double _avg = avg;
      Integer _peso = d.getPeso();
      avg = (_avg + (_peso).intValue());
    }
    int _size = denuncias.size();
    return (avg / _size);
  }
  
  public Object denunciar(final String motivo, final String descripcion, final Jugador j) {
    return null;
  }
  
  @Pure
  public EstadisticasPj getEst() {
    return this.est;
  }
  
  public void setEst(final EstadisticasPj est) {
    this.est = est;
  }
  
  @Pure
  public Collection<Denuncia> getDenuncias() {
    return this.denuncias;
  }
  
  public void setDenuncias(final Collection<Denuncia> denuncias) {
    this.denuncias = denuncias;
  }
}
