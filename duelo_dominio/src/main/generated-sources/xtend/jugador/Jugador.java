package jugador;

import com.google.common.base.Objects;
import denuncias.Denuncia;
import java.util.ArrayList;
import java.util.Collection;
import jugador.EstadisticasPj;
import jugador.Personaje;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Jugador {
  private String nombre;
  
  private Collection<EstadisticasPj> est;
  
  private Collection<Denuncia> denuncias;
  
  public Jugador(final String nombre) {
    this.nombre = nombre;
    ArrayList<Denuncia> _newArrayList = CollectionLiterals.<Denuncia>newArrayList();
    this.denuncias = _newArrayList;
    ArrayList<EstadisticasPj> _newArrayList_1 = CollectionLiterals.<EstadisticasPj>newArrayList();
    this.est = _newArrayList_1;
  }
  
  public int ranking() {
    Integer _tPeso = this.totPeso(this.denuncias);
    Integer _cantPeleasGanadas = this.cantPeleasGanadas(this.est);
    return ((_tPeso).intValue() * (_cantPeleasGanadas).intValue());
  }
  
  private Integer totPeso(final Collection<Denuncia> denuncias) {
    final Function2<Integer, Denuncia, Integer> _function = new Function2<Integer, Denuncia, Integer>() {
      public Integer apply(final Integer peso, final Denuncia den) {
        Integer _peso = den.getPeso();
        return Integer.valueOf(((peso).intValue() + (_peso).intValue()));
      }
    };
    return IterableExtensions.<Denuncia, Integer>fold(denuncias, Integer.valueOf(0), _function);
  }
  
  public Integer cantPeleasGanadas(final Collection<EstadisticasPj> est) {
    final Function2<Integer, EstadisticasPj, Integer> _function = new Function2<Integer, EstadisticasPj, Integer>() {
      public Integer apply(final Integer wins, final EstadisticasPj pj) {
        Integer _duelosGanados = pj.getDuelosGanados();
        return Integer.valueOf(((wins).intValue() + (_duelosGanados).intValue()));
      }
    };
    return IterableExtensions.<EstadisticasPj, Integer>fold(est, Integer.valueOf(0), _function);
  }
  
  public boolean addDenuncia(final Denuncia d) {
    return this.denuncias.add(d);
  }
  
  public boolean equals(final Object o) {
    return true;
  }
  
  public String toString() {
    int _size = this.denuncias.size();
    String _string = Integer.valueOf(_size).toString();
    String _plus = ((("Jugador: " + this.nombre) + " Denuncias: ") + _string);
    String _plus_1 = (_plus + " ranking: ");
    int _ranking = this.ranking();
    String _string_1 = Integer.valueOf(_ranking).toString();
    return (_plus_1 + _string_1);
  }
  
  public Integer ganeYSoyRival(final Personaje p, final String pos, final Integer califi) {
    EstadisticasPj _apply = this.buscarEst.apply(p);
    return _apply.ganoComoRival(pos, califi);
  }
  
  public Integer perdiYSoyRival(final Personaje p, final String pos, final Integer califi) {
    EstadisticasPj _apply = this.buscarEst.apply(p);
    return _apply.perdioComoRival(pos, califi);
  }
  
  public Integer ganeYSoyRetador(final Personaje p, final String pos, final Integer califi) {
    EstadisticasPj _apply = this.buscarEst.apply(p);
    return _apply.ganoComoRetador(pos, califi);
  }
  
  public Integer perdiYSoyRetador(final Personaje p, final String pos, final Integer califi) {
    EstadisticasPj _apply = this.buscarEst.apply(p);
    return _apply.perdioComoRetador(pos, califi);
  }
  
  public Integer empate(final Personaje p, final String pos, final Integer califi) {
    EstadisticasPj _apply = this.buscarEst.apply(p);
    return _apply.empato();
  }
  
  private final Function1<Personaje, EstadisticasPj> buscarEst = new Function1<Personaje, EstadisticasPj>() {
    public EstadisticasPj apply(final Personaje p) {
      final Function1<EstadisticasPj, Boolean> _function = new Function1<EstadisticasPj, Boolean>() {
        public Boolean apply(final EstadisticasPj estadistica) {
          String _nombre = estadistica.getNombre();
          String _nombre_1 = p.getNombre();
          return Boolean.valueOf(_nombre.equals(_nombre_1));
        }
      };
      EstadisticasPj estad = IterableExtensions.<EstadisticasPj>findFirst(Jugador.this.est, _function);
      final Function1<EstadisticasPj, Boolean> _function_1 = new Function1<EstadisticasPj, Boolean>() {
        public Boolean apply(final EstadisticasPj estadistica) {
          String _nombre = estadistica.getNombre();
          String _nombre_1 = p.getNombre();
          return Boolean.valueOf(_nombre.equals(_nombre_1));
        }
      };
      EstadisticasPj _findFirst = IterableExtensions.<EstadisticasPj>findFirst(Jugador.this.est, _function_1);
      boolean _equals = Objects.equal(_findFirst, null);
      if (_equals) {
        String _nombre = p.getNombre();
        EstadisticasPj _estadisticasPj = new EstadisticasPj(_nombre);
        estad = _estadisticasPj;
        Jugador.this.est.add(estad);
      }
      return estad;
    }
  };
  
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
  public Function1<Personaje, EstadisticasPj> getBuscarEst() {
    return this.buscarEst;
  }
}
