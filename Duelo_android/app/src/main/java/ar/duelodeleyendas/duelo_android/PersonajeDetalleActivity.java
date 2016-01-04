package ar.duelodeleyendas.duelo_android;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;

import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;

import ar.duelodeleyendas.duelo_android.domain.EstadisticaDePersonaje;

/**
 * Created by ramshell on 21/11/15.
 */
public class PersonajeDetalleActivity extends SecondaryActivity implements PersonajeDetalleFragment.Callbacks{

    public static final String ARG_ITEM_ID = "item_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personaje_detail);

        String fragmentToReplace = PersonajeDetalleFragment.ARG_ITEM_ID;
        Fragment objectFragment = new PersonajeDetalleFragment();
        int idAReemplazar = R.id.personaje_detail_container;
        createFragmentAndAddToTheActivity(savedInstanceState, fragmentToReplace, objectFragment, idAReemplazar);


    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {

            navigateUpTo(new Intent(this, MainLobbyActivity.class));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onClickButton(EstadisticaDePersonaje estadisticaDePersonaje) {
        Intent detailIntent = new Intent(PersonajeDetalleActivity.this, PersonajeEstadisticaActivity.class);
        detailIntent.putExtra(EstadisticaPersonajeFragment.ARG_ITEM_ID , estadisticaDePersonaje);
        startActivity(detailIntent);

    }



}
