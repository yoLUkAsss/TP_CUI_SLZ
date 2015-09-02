package jugador;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Denuncia {
  private Integer peso;
  
  @Pure
  public Integer getPeso() {
    return this.peso;
  }
  
  public void setPeso(final Integer peso) {
    this.peso = peso;
  }
}
