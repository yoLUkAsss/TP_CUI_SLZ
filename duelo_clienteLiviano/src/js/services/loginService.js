angular.module('dueloLeyendasApp')
      .service('LoginService',function($http){
  this.usuario = "";
  this.login = function(sheison,callback,errorHandler){
    $http({
            url: 'login',
            method: "POST",
            data: sheison,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(callback).error(errorHandler);
  };
})
