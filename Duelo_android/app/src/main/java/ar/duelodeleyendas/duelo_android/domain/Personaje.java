package ar.duelodeleyendas.duelo_android.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lucas on 20/11/2015.
 */
public class Personaje {
    Long id;
    String nombre;
    List<String> especialidades;
    List<String> debilidades;
    String posicionIdeal;


    public Personaje(String nombre , String nuevaPosicionIdeal) {
        this.nombre = nombre;
        this.posicionIdeal = nuevaPosicionIdeal;
        this.especialidades = new ArrayList<String>();
        this.debilidades = new ArrayList<String>();
    }

    public void setNombre(String nombre) {this.nombre=nombre;}
    public void setPosicionIdeal(String nuevaPosicion) {this.posicionIdeal=nuevaPosicion;}
    public String getNombre() {return this.nombre;}
    public String getPosicionIdeal() {return this.posicionIdeal;}
    public Long getId() {return this.id;}
    public void setId(Long id) {this.id=id;}

    public void agregarDebilidad(String nuevaDebilidad) {this.debilidades.add(nuevaDebilidad);}
    public void agregarEspecialidad(String nuevaEspecialidad) {this.especialidades.add(nuevaEspecialidad);}

    @Override
    public String toString() {return this.nombre;}


}

