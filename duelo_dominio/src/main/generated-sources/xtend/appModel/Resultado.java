package appModel;

import jugador.Jugador;

@SuppressWarnings("all")
public abstract class Resultado {
  protected Jugador j;
  
  public Resultado(final Jugador j) {
    this.j = j;
  }
  
  public abstract String getTitle();
  
  public abstract String getDescription();
}
