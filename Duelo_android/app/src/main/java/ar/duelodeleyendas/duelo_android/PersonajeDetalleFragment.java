package ar.duelodeleyendas.duelo_android;

import android.app.Activity;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import ar.duelodeleyendas.duelo_android.adapters.DebilidadesAdapter;
import ar.duelodeleyendas.duelo_android.adapters.FortalezasAdapter;
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
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.personaje_detail_fragment, container, false);

        if (personaje != null) {
            ((TextView) rootView.findViewById(R.id.nombre_del_personaje)).setText(personaje.getNombre());

            int idDeImagen = getResources().getIdentifier("R.drawable." + personaje.getNombre() + "Icon.jpg" , null, null);

            ((ImageView) rootView.findViewById(R.id.imagen_del_personaje)).setImageResource(idDeImagen);

            DebilidadesAdapter debilidadesAdapter = new DebilidadesAdapter(getActivity() , personaje.getDebilidades());
            ((ListView) rootView.findViewById(R.id.lista_debilidades)).setAdapter(debilidadesAdapter);

            FortalezasAdapter fortalezasAdapter = new FortalezasAdapter(getActivity() , personaje.getEspecialidades());
            ((ListView) rootView.findViewById(R.id.lista_especialidades)).setAdapter(fortalezasAdapter);

            ((TextView) rootView.findViewById(R.id.posicion_ideal_personaje)).setText(personaje.getPosicionIdeal());

        }

        return rootView;
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }


}
