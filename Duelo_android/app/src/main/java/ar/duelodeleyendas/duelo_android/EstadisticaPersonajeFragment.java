package ar.duelodeleyendas.duelo_android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ar.duelodeleyendas.duelo_android.domain.EstadisticaDePersonaje;
import ar.duelodeleyendas.duelo_android.domain.Personaje;

/**
 * Created by exilio on 23/11/15.
 */
public class EstadisticaPersonajeFragment extends Fragment {

    public static final String ARG_ITEM_ID = "item_id";

    private EstadisticaDePersonaje estadisticaDePersonaje;

    public EstadisticaPersonajeFragment(){}

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments().containsKey(ARG_ITEM_ID)) {
            estadisticaDePersonaje = (EstadisticaDePersonaje) getArguments().get(ARG_ITEM_ID);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.actual_estadistica_fragment, container, false);
        if (estadisticaDePersonaje != null) { llenarEstadisticas(rootView); }
        return rootView;
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    private void llenarEstadisticas(View rootView) {
        ((TextView) rootView.findViewById(R.id.mejor_ubicacion_personaje)).setText(estadisticaDePersonaje.getMejorUbicacion());
        ((TextView) rootView.findViewById(R.id.puntaje_personaje)).setText(estadisticaDePersonaje.getPuntaje());
        ((TextView) rootView.findViewById(R.id.jugadas_personaje)).setText(estadisticaDePersonaje.getJugadas());
        ((TextView) rootView.findViewById(R.id.ganadas_personaje)).setText(estadisticaDePersonaje.getGanadas());
        ((TextView) rootView.findViewById(R.id.kills_personaje)).setText(estadisticaDePersonaje.getKills());
        ((TextView) rootView.findViewById(R.id.deaths_personaje)).setText(estadisticaDePersonaje.getDeaths());
        ((TextView) rootView.findViewById(R.id.assists_personaje)).setText(estadisticaDePersonaje.getAssists());
    }

}
