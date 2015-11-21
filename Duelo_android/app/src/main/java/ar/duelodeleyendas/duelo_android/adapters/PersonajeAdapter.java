package ar.duelodeleyendas.duelo_android.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

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

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View rowView = inflater.inflate(R.layout.row_layout, parent, false);

        final Personaje personaje = getItem(position);

        TextView tvPelicula = (TextView) rowView.findViewById(R.id.id_nombre_personaje);
        tvPelicula.setText(personaje.toString());

        return rowView;
    }
}
