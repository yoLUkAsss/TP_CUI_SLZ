angular.module('dueloLeyendasApp')
      .service('AllChampionsService',function(){
        this.datosDelJuego = function(idPersonaje){
          return {posicionesDuelos:[
                              {nombre:'TOP'},
                              {nombre:'BOT'},
                              {nombre:'JUNGLE'},
                              {nombre:'MID'}],
                  personajes:[
                              {id:1,
                               nombre: 'ahri',
                               imagenSrc: 'css/images/Lobby/ahri.png',
                               estadisticas: {
                                              jugadas: "2",
                                              ganadas: "8",
                                              kills: "10",
                                              deads: "18",
                                              assits: "123",
                                              mejorUbicacion: "Jungle",
                                              Puntaje: "C"
                               },
                                  caracteristicas: {
                                                    especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                    debilidades:["Poder de Ataque"],
                                                    mejorUbicacion: ["Mid"]
                                  }},
                                  {id:2,
                                   nombre: 'viper',
                                   imagenSrc: 'css/images/Lobby/viper.png',
                                   estadisticas: {
                                                  jugadas: "2",
                                                  ganadas: "8",
                                                  kills: "10",
                                                  deads: "18",
                                                  assits: "123",
                                                  mejorUbicacion: "Mid",
                                                  Puntaje: "A"
                                   },
                                      caracteristicas: {
                                                        especialidades:["ADC", "Poder de Ataque"],
                                                        debilidades:["Poder de Defensa"],
                                                        mejorUbicacion: ["Mid"]
                                      }},

                                      {id:1,
                                       nombre: 'olaf',
                                       imagenSrc: 'css/images/Lobby/olaf.png',
                                       estadisticas: {
                                                      jugadas: "2",
                                                      ganadas: "8",
                                                      kills: "10",
                                                      deads: "18",
                                                      assits: "123",
                                                      mejorUbicacion: "Mid",
                                                      Puntaje: "C"
                                       },
                                          caracteristicas: {
                                                            especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                            debilidades:["Poder de Ataque"],
                                                            mejorUbicacion: ["Top"]
                                          }},

                                    {id:1,
                                     nombre: 'amumu',
                                     imagenSrc: 'css/images/Lobby/amumu.png',
                                     estadisticas: {
                                                    jugadas: "2",
                                                    ganadas: "8",
                                                    kills: "10",
                                                    deads: "18",
                                                    assits: "123",
                                                    mejorUbicacion: "Support",
                                                    Puntaje: "C"
                                     },
                                        caracteristicas: {
                                                          especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                          debilidades:["Poder de Ataque"],
                                                          mejorUbicacion: ["Jungle"]
                                        }},

                                  {id:1,
                                   nombre: 'pudge',
                                   imagenSrc: 'css/images/Lobby/pudge.png',
                                   estadisticas: {
                                                  jugadas: "2",
                                                  ganadas: "8",
                                                  kills: "10",
                                                  deads: "18",
                                                  assits: "123",
                                                  mejorUbicacion: "Jungle",
                                                  Puntaje: "C"
                                   },
                                      caracteristicas: {
                                                        especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                        debilidades:["Poder de Ataque"],
                                                        mejorUbicacion: ["Jungle"]
                                      }},
                                {id:1,
                                 nombre: 'witchdoctor',
                                 imagenSrc: 'css/images/Lobby/witchdoctor.png',
                                 estadisticas: {
                                                jugadas: "2",
                                                ganadas: "8",
                                                kills: "10",
                                                deads: "18",
                                                assits: "123",
                                                mejorUbicacion: "Jungle",
                                                Puntaje: "C"
                                 },
                                    caracteristicas: {
                                                      especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                      debilidades:["Poder de Ataque"],
                                                      mejorUbicacion: ["Jungle"]
                                    }},
                           ]}

  };
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

});