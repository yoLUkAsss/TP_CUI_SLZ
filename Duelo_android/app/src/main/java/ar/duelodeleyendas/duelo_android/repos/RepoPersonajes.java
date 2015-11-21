package ar.duelodeleyendas.duelo_android.repos;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ar.duelodeleyendas.duelo_android.domain.Personaje;

/**
 * Created by lucas on 20/11/2015.
 */
public class RepoPersonajes {

    private List<Personaje> personajes;

    /**
     * A ser utilizado de igual forma al ejemplo de las peliculas
     */
    private static final int MAX_RESULTS = 10;

    /**
     * SINGLETON
     */
    private static RepoPersonajes instance;

    private RepoPersonajes() {
        personajes = new ArrayList<Personaje>();
    }

    public static RepoPersonajes getInstance() {
        if (instance == null) {
            instance = new RepoPersonajes();
            instance.cargarPersonajes();
        }
        return instance;
    }


    public Personaje getPersonajePorId(Long id) {
        for (Personaje personaje : this.personajes) {
            if (personaje.getId().equals(id)) {
                return personaje;
            }
        }
        return null;
    }



    private void cargarPersonajes() {
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Amumu","TOP"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Vyper", "BOT"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Ahri", "MID"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Olaf", "JUNGLE"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Pudge", "BOT"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Ashe", "MID"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Dr. Mundo", "TOP"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Fiddlestick", "JUNGLE"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Shen", "BOT"));
        RepoPersonajes.getInstance().agregarPersonaje(new Personaje("Zed","MID"));
    }

    public void agregarPersonaje(Personaje personaje) {this.personajes.add(personaje);}

    public List<Personaje> todosLosPersonajes() {return getInstance().todosLosPersonajes(null,MAX_RESULTS);}

    public List<Personaje> todosLosPersonajes(String nombre, int max) {
        Iterator<Personaje> it = personajes.iterator();
        List<Personaje> result = new ArrayList<Personaje>();
        while (it.hasNext() && max > 0) {
            Personaje personaje = it.next();
            max--;
            if (nombre == null || personaje.toString().toUpperCase().contains(nombre.toUpperCase())) {
                result.add(personaje);
            }
        }
        return result;
    }

}
