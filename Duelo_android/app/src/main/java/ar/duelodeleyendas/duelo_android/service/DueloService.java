package ar.duelodeleyendas.duelo_android.service;

import java.util.List;

import ar.duelodeleyendas.duelo_android.domain.DatosDelJuegoMobile;
import ar.duelodeleyendas.duelo_android.domain.LoginResponse;
import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.domain.PersonajeResopnse;
import ar.duelodeleyendas.duelo_android.domain.User;
import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;

/**
 * Created by ramshell on 25/11/15.
 */
public interface DueloService {

    @POST("/login")
    void logIn(@Body User username,Callback<LoginResponse> callback);

    @GET("/datosDelJuegoMobile/{idUsuario}")
    void datosDelJuego(@retrofit.http.Path("idUsuario") String id,Callback<DatosDelJuegoMobile> callback);

    @GET("/detallePersonajeMobile/{PersonajeId}")
    void getPersonaje(@retrofit.http.Path("PersonajeId") String id, Callback<PersonajeResopnse> callback);
}
