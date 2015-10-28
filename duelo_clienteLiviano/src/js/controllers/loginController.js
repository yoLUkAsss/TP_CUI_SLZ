angular.module('dueloLeyendasApp')
      .controller('LoginController',function($scope,loginService){
  $scope.login = function (){
    alert("entre");
    var idPersonaje = document.getElementById("input").value;
    var contrasenia = document.getElementById("password").value;
    var res = loginService.login(idPersonaje,contrasenia);
    if(res.id){
      return res.id;
    }
    return res.descripcion;
  };
  $scope.hola = function(){alert("hola");}
})
