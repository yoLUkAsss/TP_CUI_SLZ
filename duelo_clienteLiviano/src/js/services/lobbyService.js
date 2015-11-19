angular.module('dueloLeyendasApp')
      .service('LobbyService',function($http){

        this.datosDelJuego = function(callback,errorHandler) {
          $http.get('datosDelJuego/'+this.usuario).success(callback).error(errorHandler);
        };

        this.salir = function(callback,errorHandler){
          $http.get('logout/'+this.usuario).success(callback).error(errorHandler);
        }

        this.setUsr = function(id){
            this.usuario = id;
        };

        this.setDatos = function(datos){
            this.datos = datos;
        };

        this.getDatos = function(){
            return this.datos;

        };


      })
