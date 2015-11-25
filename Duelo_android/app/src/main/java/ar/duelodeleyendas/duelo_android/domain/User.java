package ar.duelodeleyendas.duelo_android.domain;

/**
 * Created by ramshell on 25/11/15.
 */
public class User {
    String usuario;
    String password;

    public User(String usuario, String password){
        this.usuario = usuario;
        this.password = password;
    }

    public String getUsuario(){
        return usuario;
    }

    public String getPassword(){
        return password;
    }
}
