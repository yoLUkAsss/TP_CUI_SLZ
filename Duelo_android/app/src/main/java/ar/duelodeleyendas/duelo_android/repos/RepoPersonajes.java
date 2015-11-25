package ar.duelodeleyendas.duelo_android.repos;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.service.DueloService;
import retrofit.RestAdapter;

/**
 * Created by lucas on 20/11/2015.
 */
public class RepoPersonajes {

    private List<Personaje> personajes;
    private String idUsuario;
    String SERVER_IP;
    String SERVER_IP_GENY;
    String API_URL;

    /**
     * A ser utilizado de igual forma al ejemplo de las peliculas
     */
    private static final int MAX_RESULTS = 10;

    /**
     * SINGLETON
     */
    private static RepoPersonajes instance;

    private DueloService dueloService;

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


    public void setUsuarioLogeado(String idUsuario){
        this.idUsuario = idUsuario;
    }

    public String getUsuarioLogeado(){
        return this.idUsuario;
    }



    private void cargarPersonajes() {
    }

    public void agregarPersonaje(Personaje personaje) {
        personajes.add(personaje);
    }

    public Long getMaximoId() {
        return new Long(personajes.size());
    }

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

    private void setConnection(){
        SERVER_IP = "10.0.2.2"; //esta ip se usa para comunicarse con mi localhost en el emulador de Android Studio
        SERVER_IP_GENY = "192.168.56.1";//esta ip se usa para comunicarse con mi localhost en el emulador de Genymotion
        API_URL = "http://"+ SERVER_IP_GENY +":9000";
    }

    public DueloService getDueloService(){
        if(dueloService == null) {
            setConnection();
            RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
            DueloService nuevoDueloService = restAdapter.create(DueloService.class);
            return nuevoDueloService;
        } else return dueloService;
    }

}
