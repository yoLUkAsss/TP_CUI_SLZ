package jugador

import org.omg.CORBA.UserException

class NoHayRivalException extends UserException{
	
	new(String msg) {
	super(msg)
}
	
}