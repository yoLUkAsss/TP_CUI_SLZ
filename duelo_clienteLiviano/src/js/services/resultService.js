angular.module('dueloLeyendasApp')
      .service('ResultService',function($http){

        this.informacionDelDuelo = function(callback,errorHandler){
        $http({
            url: 'http://localhost:9000/resultado',
            method: "POST",
            data: this.eleccion,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
              }).success(callback).error(errorHandler);
        };

        this.informacionDelDueloBot = function(callback,errorHandler){
          alert("llegue al principio del metodo");
        $http({
            url: 'http://localhost:9000/noRival',
            method: "POST",
            data: this.eleccion,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
              }).success(callback).error(errorHandler);
              alert("llegue al final del metodo");
        };


        this.setData = function(data) {
            this.datos = data;
        };

        this.getData = function() {
            return this.datos;
        };

        this.guardarEleccionJugador = function(eleccion) {
            this.eleccion = eleccion;
        };

    })
