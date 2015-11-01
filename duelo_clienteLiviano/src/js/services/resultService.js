angular.module('dueloLeyendasApp')
      .service('ResultService',function($http){

        this.informacionDelDuelo = function(datos,callback,errorHandler){
        $http({
            url: 'http://localhost:9000/resultado',
            method: "POST",
            data: sheison,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
              }).success(callback).error(errorHandler);
        };

    })
