angular.module('dueloLeyendasApp')
      .service('LobbyService',function($http){

        this.datosDelJuego = function(callback,errorHandler) {
            alert(this.usuario);
          $http.get('http://localhost:9000/datosDelJuego/'+this.usuario).success(callback).error(errorHandler);
          alert("termine el datosDelJuego");
        };
        this.setUsr = function(id){
            this.usuario = id;
            
        };
        
        this.setDatos = function(datos){
            alert(datos);
            this.datos = datos;
        };
        
        this.getDatos = function(){
            alert("me llaman");
            return this.datos;
            
        }
          
      })
