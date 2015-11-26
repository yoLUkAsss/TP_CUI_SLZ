package ar.duelodeleyendas.duelo_android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;

/**
 * Created by ramshell on 25/11/15.
 */
public class SecondaryActivity extends AppCompatActivity {

    protected void createFragmentAndAddToTheActivity(Bundle savedInstanceState, String fragmentIdToCreate, Fragment fragmentObject, int idAReemplazar) {
        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();

            arguments.putSerializable(fragmentIdToCreate,
                    getIntent().getSerializableExtra(fragmentIdToCreate));

            Fragment fragment = fragmentObject;
            fragment.setArguments(arguments);

            getSupportFragmentManager().beginTransaction()
                    .add(idAReemplazar, fragment)
                    .commit();
        }
    }
}
