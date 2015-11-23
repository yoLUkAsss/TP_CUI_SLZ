package ar.duelodeleyendas.duelo_android;

import android.os.Bundle;
import android.support.v4.app.Fragment;

import ar.duelodeleyendas.duelo_android.adapters.PersonajeAdapter;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


public class BarraDeNombreFragment extends Fragment {


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.barra_de_nombre_fragment, container, false);
    }
}
