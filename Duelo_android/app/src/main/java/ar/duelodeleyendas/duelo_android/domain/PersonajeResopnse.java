package ar.duelodeleyendas.duelo_android.domain;

/**
 * Created by ramshell on 25/11/15.
 */
public class PersonajeResopnse {
    private Personaje personaje;

    public PersonajeResopnse(Personaje personaje){
        this.personaje = personaje;
    }

    public Personaje getPersonaje(){
        return this.personaje;
    }
}
