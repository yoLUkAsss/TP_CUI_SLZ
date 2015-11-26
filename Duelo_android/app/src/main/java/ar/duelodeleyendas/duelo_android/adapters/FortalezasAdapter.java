package ar.duelodeleyendas.duelo_android.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import ar.duelodeleyendas.duelo_android.R;

/**
 * Created by exilio on 25/11/15.
 */
public class FortalezasAdapter extends ArrayAdapter<String> {

    Context mContext;
    LayoutInflater inflater;
    private List<String> fortalezasAMostrar = null;
    private ArrayList<String> arraylist;

    public FortalezasAdapter(Context context, List<String> fortalezas) {
        super(context, R.layout.row_fortaleza_layout, fortalezas);
        this.mContext = context;
        this.fortalezasAMostrar = fortalezas;
        this.inflater = LayoutInflater.from(mContext);
        this.arraylist = new ArrayList<String>();
        this.arraylist.addAll(fortalezas);

    }

    @Override
    public int getCount() {
        return fortalezasAMostrar.size();
    }

    @Override
    public String getItem(int position) {
        return fortalezasAMostrar.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        convertView = inflater.inflate(R.layout.row_fortaleza_layout, null);
        final String fortaleza = getItem(position);
        TextView fortalezaText = (TextView) convertView.findViewById(R.id.id_especialidad_personaje);
        fortalezaText.setText(fortaleza);
        return convertView;
    }
}