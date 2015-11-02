angular.module('dueloLeyendasApp')
      .service('LobbyService',function($http){

        this.datosDelJuego = function(callback,errorHandler) {
          $http.get('http://localhost:9000/datosDelJuego/'+this.usuario).success(callback).error(errorHandler);
        };
        this.setUsr = function(id){
            this.usuario = id;
        };

        this.setDatos = function(datos){
            this.datos = datos;
        };

        this.getDatos = function(){
            return this.datos;

        };
        this.salir = function(callback,errorHandler){
          $http.get('http://localhost:9000/logout/'+this.usuario).success(callback).error(errorHandler);
        }

      })
