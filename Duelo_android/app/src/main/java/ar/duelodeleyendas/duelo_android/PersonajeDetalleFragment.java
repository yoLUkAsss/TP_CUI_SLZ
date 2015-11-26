package ar.duelodeleyendas.duelo_android;

import android.app.Activity;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import ar.duelodeleyendas.duelo_android.adapters.DebilidadesAdapter;
import ar.duelodeleyendas.duelo_android.adapters.FortalezasAdapter;
import ar.duelodeleyendas.duelo_android.adapters.PersonajeAdapter;
import ar.duelodeleyendas.duelo_android.domain.EstadisticaDePersonaje;
import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by ramshell on 21/11/15.
 */
public class PersonajeDetalleFragment extends Fragment{

    public static final String ARG_ITEM_ID = "item_id";

    private Personaje personaje;
    private Callbacks personajeDetalleFragmentCallback = aFragmentCallback;


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

        Button boton = (Button) getView().findViewById(R.id.estadisticas_button);

        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RepoPersonajes.getInstance().getDueloService().getEstadisticasDePersonaje(personaje.getNombre(),
                        new Callback<EstadisticaDePersonaje>() {
                            @Override
                            public void success(EstadisticaDePersonaje estadisticaDePersonaje, Response response) {
                                personajeDetalleFragmentCallback.onClickButton(estadisticaDePersonaje);
                            }

                            @Override
                            public void failure(RetrofitError error) {
                                Toast.makeText(getActivity().getApplicationContext(), "Lo sentimos, hubo un error al cargar la estadistica", Toast.LENGTH_SHORT).show();
                            }
                        });
            }
        });
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);

        // Activities containing this fragment must implement its callbacks.
        if (!(activity instanceof Callbacks)) {
            throw new IllegalStateException("Activity must implement fragment's callbacks.");
        }

        personajeDetalleFragmentCallback = (Callbacks) activity;
    }

    /**
     * Sobre los callbacks
     */
    public interface Callbacks {
        void onClickButton(EstadisticaDePersonaje estadisticaDePersonaje);
    }

    private static Callbacks aFragmentCallback = new Callbacks() {
        @Override
        public void onClickButton(EstadisticaDePersonaje estadisticaDePersonaje) {
        }
    };


}
