angular.module('dueloLeyendasApp')
      .service('ResultService',function($http){

        this.informacionDelDuelo = function(callback,errorHandler){
        $http({
            url: 'resultado',
            method: "POST",
            data: this.eleccion,
              }).success(callback).error(errorHandler);
        };

        this.informacionDelDueloBot = function(callback,errorHandler){
        $http({
            url: 'noRival',
            method: "POST",
            data: this.eleccion,
              }).success(callback).error(errorHandler);
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
