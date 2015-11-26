package ar.duelodeleyendas.duelo_android.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import ar.duelodeleyendas.duelo_android.R;

/**
 * Created by exilio on 25/11/15.
 */
public class DebilidadesAdapter extends ArrayAdapter<String>  {

    Context mContext;
    LayoutInflater inflater;
    private List<String> debilidadesAMostrar = null;
    private List<String> arraylist;

    public DebilidadesAdapter(Context context, List<String> debilidades) {
        super(context, R.layout.row_layout, debilidades);
        this.mContext = context;
        this.debilidadesAMostrar = debilidades;
        this.inflater = LayoutInflater.from(mContext);
        this.arraylist = new ArrayList<String>();
        this.arraylist.addAll(debilidades);

    }

    @Override
    public int getCount() {
        return debilidadesAMostrar.size();
    }

    @Override
    public String getItem(int position) {
        return debilidadesAMostrar.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        convertView = inflater.inflate(R.layout.row_debilidad_layout, null);
        final String debilidad = getItem(position);

        TextView debilidadDePersonaje = (TextView) convertView.findViewById(R.id.id_debilidad_personaje);
        debilidadDePersonaje.setText(debilidad);

        return convertView;
    }
}
