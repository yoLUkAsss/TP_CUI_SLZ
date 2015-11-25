package ar.duelodeleyendas.duelo_android.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lucas on 20/11/2015.
 */
public class Personaje implements Serializable{
    String nombre;
    List<String> especialidades;
    List<String> debilidades;
    String posicionIdeal;


    public Personaje(String nombre , List<String> especialidades,List<String> debilidades,String posicionIdeal) {
        this.nombre = nombre;
        this.posicionIdeal = posicionIdeal;
        this.especialidades = especialidades;
        this.debilidades = debilidades;
    }

    public void setNombre(String nombre) {this.nombre=nombre;}
    public void setPosicionIdeal(String nuevaPosicion) {this.posicionIdeal=nuevaPosicion;}
    public String getNombre() {return this.nombre;}
    public String getPosicionIdeal() {return this.posicionIdeal;}
    public List<String> getEspecialidades(){ return this.especialidades;}
    public List<String> getDebilidades(){return this.debilidades; }

    public void agregarDebilidad(String nuevaDebilidad) {this.debilidades.add(nuevaDebilidad);}
    public void agregarEspecialidad(String nuevaEspecialidad) {this.especialidades.add(nuevaEspecialidad);}

    @Override
    public String toString() {return this.nombre;}


}

