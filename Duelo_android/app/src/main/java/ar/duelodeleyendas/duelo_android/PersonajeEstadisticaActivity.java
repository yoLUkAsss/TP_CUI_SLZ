package ar.duelodeleyendas.duelo_android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;


public class PersonajeEstadisticaActivity extends SecondaryActivity {

    public static final String ARG_ITEM_ID = "item_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personaje_detail);
        String fragmentToReplace = PersonajeDetalleFragment.ARG_ITEM_ID;
        EstadisticaPersonajeFragment objectFragment = new EstadisticaPersonajeFragment();
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

}
