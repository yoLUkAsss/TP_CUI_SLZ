package ar.duelodeleyendas.duelo_android.domain;

import java.io.Serializable;

public class EstadisticaDePersonaje implements Serializable{
    String jugadas;
    String ganadas;
    String mejorUbicacion;
    String kills;
    String deaths;
    String assists;
    String puntaje;

    public EstadisticaDePersonaje(String jugadas, String ganadas, String mejorUbicacion, String kills, String deaths, String assists, String puntaje){
        this.jugadas = jugadas;
        this.ganadas = ganadas;
        this.mejorUbicacion = mejorUbicacion;
        this.kills = kills;
        this.deaths= deaths;
        this.assists = assists;
        this.puntaje = puntaje;
    }

    public String getJugadas(){

        return jugadas;
    }

    public String getGanadas(){

        return ganadas;
    }

    public String getMejorUbicacion(){

        return mejorUbicacion;
    }

    public String getKills(){

        return kills;
    }

    public String getDeaths(){

        return deaths;
    }

    public String getAssists(){

        return assists;
    }

    public String getPuntaje(){

        return puntaje;
    }

}
