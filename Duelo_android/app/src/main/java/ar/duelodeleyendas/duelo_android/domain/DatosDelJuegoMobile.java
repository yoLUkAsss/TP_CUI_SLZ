package ar.duelodeleyendas.duelo_android.domain;

import java.util.List;

/**
 * Created by ramshell on 25/11/15.
 */
public class DatosDelJuegoMobile {
    List<String> personajesTotales;

    public DatosDelJuegoMobile(List<String> personajesTotales){
        this.personajesTotales = personajesTotales;

    }

    public List<String> getPersonajesTotales(){
        return this.personajesTotales;
    }
}

