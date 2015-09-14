package jugador;

import java.util.ArrayList;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class EstadisticasPj {
  private String nombre;
  
  private Integer duelosIniciados;
  
  private Integer duelosGanados;
  
  private Integer duelosGanadosNoIniciados;
  
  private Integer derrotasNoIniciadas;
  
  private Integer duelosEmpatados;
  
  private ArrayList<String> posicionesUsadas;
  
  private String mejorUbicacion;
  
  private Integer calificacion;
  
  public EstadisticasPj(final String nombre) {
    this.nombre = nombre;
    this.duelosIniciados = Integer.valueOf(0);
    this.duelosGanados = Integer.valueOf(0);
    this.duelosGanadosNoIniciados = Integer.valueOf(0);
    this.derrotasNoIniciadas = Integer.valueOf(0);
    this.duelosEmpatados = Integer.valueOf(0);
    this.mejorUbicacion = (this.nombre + " aun no gano un duelo iniciado... NOOB!!!");
    ArrayList<String> _newArrayList = CollectionLiterals.<String>newArrayList();
    this.posicionesUsadas = _newArrayList;
    this.calificacion = Integer.valueOf(0);
  }
  
  public Integer puntaje() {
    return this.calificacion;
  }
  
  public Integer ganoComoRetador(final String pos, final Integer nuevaCalificacion) {
    Integer _xblockexpression = null;
    {
      this.duelosIniciados++;
      this.duelosGanados++;
      this.posicionesUsadas.add(pos);
      this.mejorUbicacion = pos;
      _xblockexpression = this.calificacion = nuevaCalificacion;
    }
    return _xblockexpression;
  }
  
  public Integer perdioComoRetador(final String pos, final Integer nuevaCalificacion) {
    Integer _xblockexpression = null;
    {
      this.duelosIniciados++;
      this.posicionesUsadas.add(pos);
      _xblockexpression = this.calificacion = nuevaCalificacion;
    }
    return _xblockexpression;
  }
  
  public Integer ganoComoRival(final String pos, final Integer nuevaCalificacion) {
    Integer _xblockexpression = null;
    {
      this.duelosGanados++;
      _xblockexpression = this.duelosGanadosNoIniciados++;
    }
    return _xblockexpression;
  }
  
  public Integer perdioComoRival(final String pos, final Integer nuevaCalificacion) {
    return this.derrotasNoIniciadas++;
  }
  
  public Integer empato() {
    return this.duelosEmpatados++;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Integer getDuelosIniciados() {
    return this.duelosIniciados;
  }
  
  public void setDuelosIniciados(final Integer duelosIniciados) {
    this.duelosIniciados = duelosIniciados;
  }
  
  @Pure
  public Integer getDuelosGanados() {
    return this.duelosGanados;
  }
  
  public void setDuelosGanados(final Integer duelosGanados) {
    this.duelosGanados = duelosGanados;
  }
  
  @Pure
  public Integer getDuelosGanadosNoIniciados() {
    return this.duelosGanadosNoIniciados;
  }
  
  public void setDuelosGanadosNoIniciados(final Integer duelosGanadosNoIniciados) {
    this.duelosGanadosNoIniciados = duelosGanadosNoIniciados;
  }
  
  @Pure
  public Integer getDerrotasNoIniciadas() {
    return this.derrotasNoIniciadas;
  }
  
  public void setDerrotasNoIniciadas(final Integer derrotasNoIniciadas) {
    this.derrotasNoIniciadas = derrotasNoIniciadas;
  }
  
  @Pure
  public Integer getDuelosEmpatados() {
    return this.duelosEmpatados;
  }
  
  public void setDuelosEmpatados(final Integer duelosEmpatados) {
    this.duelosEmpatados = duelosEmpatados;
  }
  
  @Pure
  public ArrayList<String> getPosicionesUsadas() {
    return this.posicionesUsadas;
  }
  
  public void setPosicionesUsadas(final ArrayList<String> posicionesUsadas) {
    this.posicionesUsadas = posicionesUsadas;
  }
  
  @Pure
  public String getMejorUbicacion() {
    return this.mejorUbicacion;
  }
  
  public void setMejorUbicacion(final String mejorUbicacion) {
    this.mejorUbicacion = mejorUbicacion;
  }
  
  @Pure
  public Integer getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final Integer calificacion) {
    this.calificacion = calificacion;
  }
}
