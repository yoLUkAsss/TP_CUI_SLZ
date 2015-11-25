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
public class PersonajeAdapter extends ArrayAdapter<String> {

    Context mContext;
    LayoutInflater inflater;
    private List<String> personajesAMostrar = null;
    private ArrayList<String> arraylist;

    public PersonajeAdapter(Context context, List<String> personajes) {
        super(context, R.layout.row_layout, personajes);
        this.mContext = context;
        this.personajesAMostrar = personajes;
        this.inflater = LayoutInflater.from(mContext);
        this.arraylist = new ArrayList<String>();
        this.arraylist.addAll(personajes);

    }

    @Override
    public int getCount() {
        return personajesAMostrar.size();
    }

    @Override
    public String getItem(int position) {
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


            final String personaje = getItem(position);

            TextView personajeText = (TextView) convertView.findViewById(R.id.id_nombre_personaje);
            personajeText.setText(personaje);

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
            for (String wp : arraylist)
            {
                if (wp.contains(charText))
                {
                    personajesAMostrar.add(wp);
                }
            }
        }
        notifyDataSetChanged();

    }
}
