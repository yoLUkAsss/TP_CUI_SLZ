package jugador;

import org.omg.CORBA.UserException;

@SuppressWarnings("all")
public class NoHayRivalException extends UserException {
  public NoHayRivalException(final String msg) {
    super(msg);
  }
}
