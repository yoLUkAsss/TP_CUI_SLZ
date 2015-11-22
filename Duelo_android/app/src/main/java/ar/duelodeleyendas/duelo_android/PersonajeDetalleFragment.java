package ar.duelodeleyendas.duelo_android;

import android.app.Activity;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.widget.EditText;
import android.widget.TextView;

import ar.duelodeleyendas.duelo_android.adapters.PersonajeAdapter;
import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;

/**
 * Created by ramshell on 21/11/15.
 */
public class PersonajeDetalleFragment extends Fragment{

    public static final String ARG_ITEM_ID = "item_id";

    private Personaje personaje;


    public PersonajeDetalleFragment(){}

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(ARG_ITEM_ID)) {
            // Load the dummy content specified by the fragment
            // arguments. In a real-world scenario, use a Loader
            // to load content from a content provider.
            personaje = (Personaje) getArguments().get(ARG_ITEM_ID);

            Activity activity = this.getActivity();
            TextView txt = (TextView) activity.findViewById(R.id.nombre_del_personaje);
            if (txt != null) {
                txt.setText(personaje.getNombre());
            } else {
                activity.setTitle(personaje.getNombre());
            }
        }
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }


}
