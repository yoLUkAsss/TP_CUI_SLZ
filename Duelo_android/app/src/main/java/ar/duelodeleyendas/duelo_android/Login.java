package ar.duelodeleyendas.duelo_android;

import android.app.ActionBar;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by lucas on 21/11/2015.
 */
public class Login extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.personaje_activity_actual);

        Button boton = (Button) findViewById(R.id.id_ingresar_button);

        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String username = ((EditText) findViewById(R.id.id_usuario)).getText().toString();
                String password = ((EditText) findViewById(R.id.id_contraseña)).getText().toString();

                if (username.equals("admin") && password.equals("admin")) {

                    Intent mainLobby = new Intent(Login.this , MainLobby.class);
                    startActivity(mainLobby);

                } else {

                    Toast.makeText(getApplicationContext() , "Usuario o Contraseña incorrecta" , Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
