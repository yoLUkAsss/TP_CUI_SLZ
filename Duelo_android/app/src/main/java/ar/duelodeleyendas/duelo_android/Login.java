package ar.duelodeleyendas.duelo_android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import ar.duelodeleyendas.duelo_android.domain.LoginResponse;
import ar.duelodeleyendas.duelo_android.domain.User;
import ar.duelodeleyendas.duelo_android.repos.RepoPersonajes;
import ar.duelodeleyendas.duelo_android.service.DueloService;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by lucas on 21/11/2015.
 */
public class Login extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_activity);

        Button boton = (Button) findViewById(R.id.id_ingresar_button);

        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username = ((EditText) findViewById(R.id.id_usuario)).getText().toString();
                String password = ((EditText) findViewById(R.id.id_contraseña)).getText().toString();

                logear(username, password);



            }
        });
    }

    private void logear(String username, String password){
        DueloService dueloService = createDueloService();
        dueloService.logIn(new User(username,password),new Callback<LoginResponse>() {
            @Override
            public void success(LoginResponse loginResponse, Response response) {
                RepoPersonajes.getInstance().setUsuarioLogeado(loginResponse.getId());
                Intent mainLobby = new Intent(Login.this, MainLobbyActivity.class);
                startActivity(mainLobby);
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getApplicationContext(), "Usuario o Contraseña incorrecta", Toast.LENGTH_SHORT).show();
            }
        });
    }



    private DueloService createDueloService(){
        return RepoPersonajes.getInstance().getDueloService();
    }
}
