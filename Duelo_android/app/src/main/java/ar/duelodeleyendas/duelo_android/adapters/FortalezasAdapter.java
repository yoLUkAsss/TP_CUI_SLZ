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
public class FortalezasAdapter extends AdapterPropio {

    public FortalezasAdapter(Context context, List<String> lista, int layoutALlenar, int idABuscar){
        super(context,lista,layoutALlenar,idABuscar);
    }
}
