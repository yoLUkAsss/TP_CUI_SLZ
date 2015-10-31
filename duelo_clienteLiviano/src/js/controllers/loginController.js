// angular.module('dueloLeyendasApp')
//       .controller('LoginController',function($scope,$state,LoginService,LobbyService){
//   $scope.login = function (){
//     var idPersonaje = document.getElementById("input").value;
//     var contrasenia = document.getElementById("password").value;
//     var res = LoginService.login(idPersonaje,contrasenia);
//     $state.go('noTienesRival');
//     if(res.id){
//       LobbyService.datosDelJuego(res.id);
//       return res.id;
//     }
//     return res.descripcion;
//   }
// })
angular.module('dueloLeyendasApp')
      .controller('LoginController',['$scope','$state','LoginService','LobbyService',function($scope,$state,LoginService,LobbyService){
  $scope.user = {usuario: "", password: ""};
  $scope.login = function (){
    LoginService.login($scope.user);
  };
  $scope.callback = function(data){
    alert(data.id);
  };
  $scope.erroHandler=function(error){
    alert(error.descripcion);

  };
}])
