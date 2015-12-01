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
 * Created by exilio on 28/11/15.
 */
public class AdapterPropio extends ArrayAdapter<String> {

    Context mContext;
    LayoutInflater inflater;
    protected List<String> listaAMostrar = null;
    protected ArrayList<String> arraylist;
    protected int layout;
    protected int idElemento;

    public AdapterPropio(Context context, List<String> lista , int layoutALlenar, int idABuscar) {
        super(context,layoutALlenar,lista);
        this.layout = layoutALlenar;
        this.mContext = context;
        this.listaAMostrar = lista;
        this.idElemento = idABuscar;
        this.inflater = LayoutInflater.from(mContext);
        this.arraylist = new ArrayList<String>();
        this.arraylist.addAll(lista);
    }

    @Override
    public int getCount() {
        return listaAMostrar.size();
    }

    @Override
    public String getItem(int position) {
        return listaAMostrar.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView (int position, View convertView , ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = inflater.inflate(this.layout, null);
        final String elemento = getItem(position);
        TextView rowALlenar = (TextView) convertView.findViewById(this.idElemento);
        rowALlenar.setText(elemento);
        return convertView;
    }
}
