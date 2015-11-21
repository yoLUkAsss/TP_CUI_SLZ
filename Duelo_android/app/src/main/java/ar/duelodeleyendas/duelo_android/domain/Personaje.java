package ar.duelodeleyendas.duelo_android.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lucas on 20/11/2015.
 */
public class Personaje {
    String id;
    List<String> especialidades;
    List<String> debilidades;
    String posicionIdeal;


    public Personaje(String nombre , String nuevaPosicionIdeal) {
        this.id = nombre;
        this.posicionIdeal = nuevaPosicionIdeal;
        this.especialidades = new ArrayList<String>();
        this.debilidades = new ArrayList<String>();
    }

    public void setId(String nombre) {this.id=nombre;}
    public void setPosicionIdeal(String nuevaPosicion) {this.posicionIdeal=nuevaPosicion;}
    public String getId() {return this.id;}
    public String getPosicionIdeal() {return this.posicionIdeal;}

    public void agregarDebilidad(String nuevaDebilidad) {this.debilidades.add(nuevaDebilidad);}
    public void agregarEspecialidad(String nuevaEspecialidad) {this.especialidades.add(nuevaEspecialidad);}

    @Override
    public String toString() {return this.id;}


}

