angular.module('dueloLeyendasApp')
      .service('LoginService',['$http',function($http){
  this.login = function(sheison,callback,errorHandler){
    $http({
            url: 'http://localhost:9000/login',
            method: "POST",
            data: sheison,
            headers: {'Content-Type': 'application/json'}
        }).success(callback).error(errorHandler);

  }

    
}])
