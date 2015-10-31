angular.module('dueloLeyendasApp')
      .service('LoginService',function($http){
  this.login = function(sheison,callback,errorHandler){
    $http({
            url: 'http://localhost:9000/login',
            method: "POST",
            data: sheison,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(callback).error(errorHandler);
  };
})
