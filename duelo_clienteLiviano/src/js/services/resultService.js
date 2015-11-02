angular.module('dueloLeyendasApp')
      .service('ResultService',function($http){

        this.informacionDelDuelo = function(datos,callback,errorHandler){
        $http({
            url: 'http://localhost:9000/resultado',
            method: "POST",
            data: datos,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
              }).success(callback).error(errorHandler);
        };

        this.setData = function(data) {
            this.datos = data;
        };

        this.getData = function() {
            return this.datos;
        };
    })
