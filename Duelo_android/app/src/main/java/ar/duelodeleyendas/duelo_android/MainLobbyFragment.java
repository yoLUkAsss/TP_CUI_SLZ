package ar.duelodeleyendas.duelo_android;

import android.app.ListFragment;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;

import javax.security.auth.callback.Callback;

import ar.duelodeleyendas.duelo_android.adapters.PersonajeAdapter;
import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;

/**
 * Created by lucas on 21/11/2015.
 */
public class MainLobbyFragment extends ListFragment {

    private Callbacks mainLobbyFragmentCallback = aFragment;

    public MainLobbyFragment() {

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setListAdapter(new PersonajeAdapter(
                getActivity(),
                RepoPersonajes.getInstance().todosLosPersonajes(null, 10)));

    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        super.onListItemClick(listView, view, position, id);

        // Notify the active callbacks interface (the activity, if the
        // fragment is attached to one) that an item has been selected.
        Personaje personaje = RepoPersonajes.getInstance().getPersonajePorId(id);
        mainLobbyFragmentCallback.onItemSelected(personaje);
    }


    /**
     * Sobre los callbacks
     */
    public interface Callbacks {
        void onItemSelected(Personaje personaje);
    }

    private static Callbacks aFragment = new Callbacks() {
        @Override
        public void onItemSelected(Personaje personaje) {
        }
    };

}
