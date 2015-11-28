package ar.duelodeleyendas.duelo_android.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.R;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Created by lucas on 21/11/2015.
 */
public class PersonajeAdapter extends AdapterPropio {

    public PersonajeAdapter(Context context, List<String> personajes, int layoutALlenar, int idABuscar) {
        super(context, personajes, layoutALlenar, idABuscar);
    }

    // Filter Class
    public void filter(String charText) {
        charText = charText.toLowerCase(Locale.getDefault());
        this.listaAMostrar.clear();
        if (charText.length() == 0) {
            listaAMostrar.addAll(arraylist);
        }
        else {
            for (String wp : arraylist) {
                if (wp.contains(charText)) {
                    listaAMostrar.add(wp);
                }
            }
        }
        notifyDataSetChanged();
    }
}
