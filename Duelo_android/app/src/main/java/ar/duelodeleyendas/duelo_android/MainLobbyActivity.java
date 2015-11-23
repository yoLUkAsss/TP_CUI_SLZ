package ar.duelodeleyendas.duelo_android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import java.util.Locale;

import ar.duelodeleyendas.duelo_android.domain.Personaje;

/**
 * Created by lucas on 21/11/2015.
 */
public class MainLobbyActivity extends AppCompatActivity implements MainLobbyFragment.Callbacks{

    /**
     * Whether or not the activity is in two-pane mode, i.e. running on a tablet
     * device.
     */
    private boolean mTwoPane;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actual_lobby_activity);

        if (findViewById(R.id.personaje_detail_container) != null) {
            // The detail container view will be present only in the
            // large-screen layouts (res/values-large and
            // res/values-sw600dp). If this view is present, then the
            // activity should be in two-pane mode.
            mTwoPane = true;

            // In two-pane mode, list items should be given the
            // 'activated' state when touched.
            ((MainLobbyFragment) getSupportFragmentManager()
                    .findFragmentById(R.id.personaje_list))
                    .setActivateOnItemClick(true);
        }

    }

    @Override
    public void onItemSelected(Personaje personaje) {
        if (mTwoPane) {
            // In two-pane mode, show the detail view in this activity by
            // adding or replacing the detail fragment using a
            // fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putSerializable(PersonajeDetalleFragment.ARG_ITEM_ID, personaje);
            PersonajeDetalleFragment fragment = new PersonajeDetalleFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.personaje_detail_container, fragment)
                    .commit();

        } else {
//             In single-pane mode, simply start the detail activity
//             for the selected item ID.
            Intent detailIntent = new Intent(MainLobbyActivity.this, PersonajeDetalleActivity.class);
            detailIntent.putExtra(PersonajeDetalleFragment.ARG_ITEM_ID , personaje);
            startActivity(detailIntent);
        }
    }






}
