package jugador;

import java.util.ArrayList;
import java.util.Collection;
import jugador.Denuncia;
import jugador.EstadisticasPj;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Jugador {
  private String nombre;
  
  private Collection<EstadisticasPj> est;
  
  private Collection<Denuncia> denuncias;
  
  private Integer cantPeleasGanadas;
  
  public Jugador() {
    ArrayList<Denuncia> _newArrayList = CollectionLiterals.<Denuncia>newArrayList();
    this.denuncias = _newArrayList;
    this.cantPeleasGanadas = Integer.valueOf(0);
  }
  
  public Double ranking() {
    double _avgCalifPers = this.avgCalifPers(this.est);
    double _avgPeso = this.avgPeso(this.denuncias);
    double _minus = (_avgCalifPers - _avgPeso);
    return Double.valueOf((_minus * (this.cantPeleasGanadas).intValue()));
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
  
  private double avgCalifPers(final Collection<EstadisticasPj> est) {
    double avg = 0D;
    for (final EstadisticasPj e : est) {
      double _avg = avg;
      Integer _puntaje = e.puntaje();
      avg = (_avg + (_puntaje).intValue());
    }
    int _size = this.denuncias.size();
    return (avg / _size);
  }
  
  public boolean addDenuncia(final Denuncia d) {
    return this.denuncias.add(d);
  }
  
  public Integer escalon() {
    Double i = this.ranking();
    int j = 1;
    while (((i).doubleValue() > 0)) {
      {
        i = Double.valueOf(((i).doubleValue() - 500));
        j++;
      }
    }
    return Integer.valueOf(j);
  }
  
  public String toString() {
    int _size = this.denuncias.size();
    String _string = Integer.valueOf(_size).toString();
    String _plus = ((("Jugador: " + this.nombre) + " Denuncias: ") + _string);
    String _plus_1 = (_plus + " ranking: ");
    Double _ranking = this.ranking();
    String _string_1 = _ranking.toString();
    String _plus_2 = (_plus_1 + _string_1);
    String _plus_3 = (_plus_2 + "=> escalon: ");
    Integer _escalon = this.escalon();
    String _string_2 = _escalon.toString();
    return (_plus_3 + _string_2);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Collection<EstadisticasPj> getEst() {
    return this.est;
  }
  
  public void setEst(final Collection<EstadisticasPj> est) {
    this.est = est;
  }
  
  @Pure
  public Collection<Denuncia> getDenuncias() {
    return this.denuncias;
  }
  
  public void setDenuncias(final Collection<Denuncia> denuncias) {
    this.denuncias = denuncias;
  }
  
  @Pure
  public Integer getCantPeleasGanadas() {
    return this.cantPeleasGanadas;
  }
  
  public void setCantPeleasGanadas(final Integer cantPeleasGanadas) {
    this.cantPeleasGanadas = cantPeleasGanadas;
  }
}
