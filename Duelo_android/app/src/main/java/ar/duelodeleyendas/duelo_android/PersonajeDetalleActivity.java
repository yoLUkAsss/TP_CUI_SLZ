package ar.duelodeleyendas.duelo_android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.TextView;

import org.w3c.dom.Text;

import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;

/**
 * Created by ramshell on 21/11/15.
 */
public class PersonajeDetalleActivity extends AppCompatActivity {

    public static final String ARG_ITEM_ID = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personaje_detail);

        // savedInstanceState is non-null when there is fragment state
        // saved from previous configurations of this activity
        // (e.g. when rotating the screen from portrait to landscape).
        // In this case, the fragment will automatically be re-added
        // to its container so we don't need to manually add it.
        // For more information, see the Fragments API guide at:
        //
        // http://developer.android.com/guide/components/fragments.html
        //
        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putSerializable(PersonajeDetalleFragment.ARG_ITEM_ID,
                    getIntent().getSerializableExtra(PersonajeDetalleFragment.ARG_ITEM_ID));
            PersonajeDetalleFragment fragment = new PersonajeDetalleFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.personaje_detail_container, fragment)
                    .commit();
        }


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
