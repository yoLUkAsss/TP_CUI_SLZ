package ar.duelodeleyendas.duelo_android;

import android.app.Fragment;
import android.os.Bundle;

import android.support.v7.app.AppCompatActivity;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;

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

            getFragmentManager().beginTransaction()
                    .setCustomAnimations(R.animator.card_flip_right_in, R.animator.card_flip_right_out,
                            R.animator.card_flip_left_in, R.animator.card_flip_left_out)
                    .add(idAReemplazar, fragment)

                    .commit();
        }
    }
}
