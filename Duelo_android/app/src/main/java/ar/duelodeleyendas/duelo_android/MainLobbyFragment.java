package ar.duelodeleyendas.duelo_android;

import android.app.Activity;
import android.app.ListFragment;
import android.os.Bundle;

import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.Locale;

import ar.duelodeleyendas.duelo_android.adapters.PersonajeAdapter;
import ar.duelodeleyendas.duelo_android.domain.DatosDelJuegoMobile;
import ar.duelodeleyendas.duelo_android.domain.Personaje;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;
import ar.duelodeleyendas.duelo_android.service.DueloService;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by lucas on 21/11/2015.
 */
public class MainLobbyFragment extends ListFragment {

    /**
     * The serialization (saved instance state) Bundle key representing the
     * activated item position. Only used on tablets.
     */
    private static final String STATE_ACTIVATED_POSITION = "activated_position";
    private static boolean listenerActive = false;

    /**
     * The current activated item position. Only used on tablets.
     */
    private int mActivatedPosition = ListView.INVALID_POSITION;

    private Callbacks mainLobbyFragmentCallback = aFragmentCallback;
    private EditText editText;
    private PersonajeAdapter miAdapter;

    public MainLobbyFragment() {

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DueloService dueloService = RepoPersonajes.getInstance().getDueloService();
        dueloService.datosDelJuego(RepoPersonajes.getInstance().getUsuarioLogeado(),
                new Callback<DatosDelJuegoMobile>() {
                    @Override
                    public void success(DatosDelJuegoMobile nombresDePersonajes, Response response) {
                        miAdapter = new PersonajeAdapter(
                                getActivity(),
                                nombresDePersonajes.getPersonajesTotales(),
                                R.layout.row_layout,
                                R.id.id_nombre_personaje);
                        setListAdapter(miAdapter);

                    }

                    @Override
                    public void failure(RetrofitError error) {
                        Toast.makeText(getActivity().getApplicationContext(), "No se han podido cargar los personajes", Toast.LENGTH_SHORT).show();
                    }
                });




    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        editText = (EditText) getView().findViewById(R.id.id_nombre_buscado);
        if(!listenerActive) {
            editText.addTextChangedListener(new TextWatcher() {
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {

                }

                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    String text = editText.getText().toString().toLowerCase(Locale.getDefault());
                    miAdapter.filter(text);
                }

                public void afterTextChanged(Editable s) {
                }
            });
            listenerActive = true;
        }
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        // Restore the previously serialized activated item position.
        if (savedInstanceState != null
                && savedInstanceState.containsKey(STATE_ACTIVATED_POSITION)) {
            setActivatedPosition(savedInstanceState.getInt(STATE_ACTIVATED_POSITION));
        }


    }


    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);

        // Activities containing this fragment must implement its callbacks.
        if (!(activity instanceof Callbacks)) {
            throw new IllegalStateException("Activity must implement fragment's callbacks.");
        }

        mainLobbyFragmentCallback = (Callbacks) activity;
    }

    @Override
    public void onDetach() {
        super.onDetach();

        // Reset the active callbacks interface to the dummy implementation.
        mainLobbyFragmentCallback = aFragmentCallback;
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        super.onListItemClick(listView, view, position, id);

        // Notify the active callbacks interface (the activity, if the
        // fragment is attached to one) that an item has been selected.
        RepoPersonajes.getInstance().getDueloService().getPersonaje(miAdapter.getItem(position),
                new Callback<Personaje>() {
                    @Override
                    public void success(Personaje personaje, Response response) {
                        mainLobbyFragmentCallback.onItemSelected(personaje);
                    }

                    @Override
                    public void failure(RetrofitError error) {
                        Toast.makeText(getActivity().getApplicationContext(), "Lo sentimos, hubo un error al cargar el personaje", Toast.LENGTH_SHORT).show();
                    }
                });

    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (mActivatedPosition != ListView.INVALID_POSITION) {
            // Serialize and persist the activated item position.
            outState.putInt(STATE_ACTIVATED_POSITION, mActivatedPosition);
        }
    }

    /**
     * Turns on activate-on-click mode. When this mode is on, list items will be
     * given the 'activated' state when touched.
     */
    public void setActivateOnItemClick(boolean activateOnItemClick) {
        // When setting CHOICE_MODE_SINGLE, ListView will automatically
        // give items the 'activated' state when touched.
        getListView().setChoiceMode(activateOnItemClick
                ? ListView.CHOICE_MODE_SINGLE
                : ListView.CHOICE_MODE_NONE);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.personaje_list_fragment, container, false);
    }


    /**
     * Sobre los callbacks
     */
    public interface Callbacks {
        void onItemSelected(Personaje personaje);
    }

    private static Callbacks aFragmentCallback = new Callbacks() {
        @Override
        public void onItemSelected(Personaje personaje) {
        }
    };

    private void setActivatedPosition(int position) {
        if (position == ListView.INVALID_POSITION) {
            getListView().setItemChecked(mActivatedPosition, false);
        } else {
            getListView().setItemChecked(position, true);
        }

        mActivatedPosition = position;
    }


}
