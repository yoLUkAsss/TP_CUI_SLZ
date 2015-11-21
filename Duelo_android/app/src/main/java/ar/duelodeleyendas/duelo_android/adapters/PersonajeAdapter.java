package ar.duelodeleyendas.duelo_android.adapters;

import android.content.Context;
import android.widget.ArrayAdapter;

import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.R;
import java.util.List;

/**
 * Created by lucas on 21/11/2015.
 */
public class PersonajeAdapter extends ArrayAdapter<Personaje> {

    public PersonajeAdapter(Context context, List<Personaje> personajes) {
        super(context, R.layout.row_layout, personajes);
    }


}
