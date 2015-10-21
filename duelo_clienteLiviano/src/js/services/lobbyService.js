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
                                                    mejorUbicacion: "Jungle"
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
                                                        mejorUbicacion: "Mid"
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
                                                      mejorUbicacion: "Jungle",
                                                      Puntaje: "C"
                                       },
                                          caracteristicas: {
                                                            especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                            debilidades:["Poder de Ataque"],
                                                            mejorUbicacion: "Jungle"
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
                                                    mejorUbicacion: "Jungle",
                                                    Puntaje: "C"
                                     },
                                        caracteristicas: {
                                                          especialidades:["Poder de Habilidad", "Poder de Defensa"],
                                                          debilidades:["Poder de Ataque"],
                                                          mejorUbicacion: "Jungle"
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
                                                        mejorUbicacion: "Jungle"
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
                                                      mejorUbicacion: "Jungle"
                                    }},

                           ]}
  }

  this.informacionDelDuelo = function() {

          return {
            informacionDelRetador: {
              jugadas: "6",
              ganadas: "3",
              kills: "18",
              deads: "8",
              assits: "14",
              mejorUbicacion: "Top",
              Puntaje: "Killing-Spread"
            },
           informacionDelRival: {
              jugadas: "3",
              ganadas: "6",
              kills: "12",
              deads: "38",
              assits: "23",
              mejorUbicacion: "Jungle",
              Puntaje: "NOOB"
            },
            tipoResultado: {
              veredicto: "Ganaste",
              valorRetador: "65",
              valorRival: "32",
              mensaje: "En hora buena",
              mensajeDelBoton: "Celebrar Victoria"
            } 
          }
        }

})
// myApp.service('helloWorldFromService', function() {
//     this.sayHello = function() {
//         return "Hello, World!"
//     };
// });
