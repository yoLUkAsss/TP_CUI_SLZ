package jugador;

import java.util.ArrayList;
import java.util.Collection;
import jugador.Denuncia;
import jugador.EstadisticasPj;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Jugador {
  private String nombre;
  
  private Collection<EstadisticasPj> est;
  
  private Collection<Denuncia> denuncias;
  
  public Jugador() {
    ArrayList<Denuncia> _newArrayList = CollectionLiterals.<Denuncia>newArrayList();
    this.denuncias = _newArrayList;
  }
  
  public Double ranking() {
    Double _avgCalifPers = this.avgCalifPers(this.est);
    double _avgPeso = this.avgPeso(this.denuncias);
    double _minus = ((_avgCalifPers).doubleValue() - _avgPeso);
    Double _cantPeleasGanadas = this.cantPeleasGanadas(this.est);
    return Double.valueOf((_minus * (_cantPeleasGanadas).doubleValue()));
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
  
  private Double avgCalifPers(final Collection<EstadisticasPj> est) {
    final Function2<Double, EstadisticasPj, Double> _function = new Function2<Double, EstadisticasPj, Double>() {
      public Double apply(final Double wins, final EstadisticasPj pj) {
        Integer _duelosGanados = pj.getDuelosGanados();
        return Double.valueOf(DoubleExtensions.operator_plus(wins, _duelosGanados));
      }
    };
    Double avg = IterableExtensions.<EstadisticasPj, Double>fold(est, Double.valueOf(0D), _function);
    int _size = this.denuncias.size();
    return Double.valueOf(((avg).doubleValue() / _size));
  }
  
  public Double cantPeleasGanadas(final Collection<EstadisticasPj> est) {
    final Function2<Double, EstadisticasPj, Double> _function = new Function2<Double, EstadisticasPj, Double>() {
      public Double apply(final Double wins, final EstadisticasPj pj) {
        Integer _duelosGanados = pj.getDuelosGanados();
        return Double.valueOf(DoubleExtensions.operator_plus(wins, _duelosGanados));
      }
    };
    return IterableExtensions.<EstadisticasPj, Double>fold(est, Double.valueOf(0D), _function);
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
}
