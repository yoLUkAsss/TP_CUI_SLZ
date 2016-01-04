package ar.duelodeleyendas.duelo_android;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;

import android.support.v7.app.AppCompatActivity;

import java.io.Serializable;

import ar.duelodeleyendas.duelo_android.domain.EstadisticaDePersonaje;
import ar.duelodeleyendas.duelo_android.domain.Personaje;


public class MainLobbyActivity extends AppCompatActivity implements MainLobbyFragment.Callbacks, PersonajeDetalleFragment.Callbacks{

    private boolean isWide;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actual_lobby_activity);

        if (esAncho()) {
            activateWideMode();
        }

    }

    @Override
    public void onItemSelected(Personaje personaje) {
        replaceActivity(personaje,
                PersonajeDetalleFragment.ARG_ITEM_ID,
                new PersonajeDetalleFragment(),
                PersonajeDetalleActivity.class);
    }

    @Override
    public void onClickButton(EstadisticaDePersonaje estadisticaDePersonaje) {
        replaceActivity(estadisticaDePersonaje,
                EstadisticaPersonajeFragment.ARG_ITEM_ID,
                new EstadisticaPersonajeFragment(),
                PersonajeEstadisticaActivity.class);
    }

    private void replaceActivity(Serializable serializable, String fragmentIdToReplace,
                                 Fragment fragment, Class<? extends AppCompatActivity> activityClassToBeOpen) {
        if (isWide) {
            Bundle arguments = new Bundle();
            arguments.putSerializable(fragmentIdToReplace, serializable);
            fragment.setArguments(arguments);


            getFragmentManager().beginTransaction()
                    .setCustomAnimations(R.animator.card_flip_right_in, R.animator.card_flip_right_out,
                            R.animator.card_flip_left_in, R.animator.card_flip_left_out)
                    .replace(R.id.personaje_detail_container, fragment)
                    .addToBackStack(null)
                    .commit();
        } else {
            Intent detailIntent = new Intent(MainLobbyActivity.this, activityClassToBeOpen);
            detailIntent.putExtra(fragmentIdToReplace, serializable);
            startActivity(detailIntent);
        }
    }

    private void activateWideMode() {
        isWide = true;
        // In wide mode, list items should be given the 'activated' state when touched.
        ((MainLobbyFragment) getFragmentManager()
                .findFragmentById(R.id.personaje_list))
                .setActivateOnItemClick(true);
    }

    private boolean esAncho() {
        return findViewById(R.id.personaje_detail_container) != null;
    }






}
