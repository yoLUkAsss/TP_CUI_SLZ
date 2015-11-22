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
public class PersonajeAdapter extends ArrayAdapter<Personaje> {

    Context mContext;
    LayoutInflater inflater;
    private List<Personaje> personajesAMostrar = null;
    private ArrayList<Personaje> arraylist;

    public PersonajeAdapter(Context context, List<Personaje> personajes) {
        super(context, R.layout.row_layout, personajes);
        this.mContext = context;
        this.personajesAMostrar = personajes;
        this.inflater = LayoutInflater.from(mContext);
        this.arraylist = new ArrayList<Personaje>();
        this.arraylist.addAll(personajes);

    }

    @Override
    public int getCount() {
        return personajesAMostrar.size();
    }

    @Override
    public Personaje getItem(int position) {
        return personajesAMostrar.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

            convertView = inflater.inflate(R.layout.row_layout, null);


            final Personaje personaje = getItem(position);

            TextView personajeText = (TextView) convertView.findViewById(R.id.id_nombre_personaje);
            personajeText.setText(personaje.toString());

        return convertView;
    }

    // Filter Class
    public void filter(String charText) {
        charText = charText.toLowerCase(Locale.getDefault());
        personajesAMostrar.clear();
        if (charText.length() == 0) {
            personajesAMostrar.addAll(arraylist);
        }
        else
        {
            for (Personaje wp : arraylist)
            {
                if (wp.getNombre().toLowerCase(Locale.getDefault()).contains(charText))
                {
                    personajesAMostrar.add(wp);
                }
            }
        }
        notifyDataSetChanged();

    }
}
