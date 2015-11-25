package ar.duelodeleyendas.duelo_android.domain;

/**
 * Created by ramshell on 25/11/15.
 */
public class LoginResponse {

    String id;
    String descripcion;

    public LoginResponse(String id, String descripcion){
        this.id = id;
        this.descripcion = descripcion;
    }

    public String getId(){
        return id;
    }

    public String getDescripcion(){
        return descripcion;
    }
}
