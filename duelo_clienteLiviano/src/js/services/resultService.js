angular.module('dueloLeyendasApp')
      .service('ResultService',function(){

        this.informacionDelDuelo = function(idJugador , idPersonaje , posicionElegida) {
          return {
            informacionDelRetador: {
              Jugadas: "6",
              Ganadas: "3",
              Kills: "18",
              Deads: "8",
              Assits: "14",
              MejorUbicacion: "Top",
              Puntaje: "Killing-Spread"
            },
           informacionDelRival: {
              Jugadas: "3",
              Ganadas: "6",
              Kills: "12",
              Deads: "38",
              Assits: "23",
              MejorUbicacion: "Jungle",
              Puntaje: "NOOB"
            },
            resultadoDuelo: {
              veredicto: "Ganaste",
              valorRetador: "65",
              valorRival: "32",
              nombreGanador: "iGzo",
              personajeRetador: "Amumu",
              personajeRival: "Viper",
              mensaje: "En hora buena",
              mensajeDelBoton: "Celebrar Victoria",
              path: "css/images/Result/asheFullSize.jpg"
            }
          }
        };

        this.jugarConRobot = function(idJugador , idPersonaje , posicionElegida) {
          return {
            informacionDelRetador: {
              Jugadas: "6",
              Ganadas: "3",
              Kills: "18",
              Deads: "8",
              Assits: "14",
              MejorUbicacion: "Top",
              Puntaje: "Killing-Spread"
            },
           informacionDelRival: {
              Jugadas: "3",
              Ganadas: "6",
              Kills: "12",
              Deads: "38",
              Assits: "23",
              MejorUbicacion: "Jungle",
              Puntaje: "NOOB"
            },
            resultadoDuelo: {
              veredicto: "Ganaste",
              valorRetador: "65",
              valorRival: "32",
              nombreGanador: "MRX",
              personajeRetador: "Amumu",
              personajeRival: "Viper",
              mensaje: "En hora buena",
              mensajeDelBoton: "Celebrar Victoria",
              path: "css/images/Result/asheFullSize.jpg"
            }
          }
        };

    })
