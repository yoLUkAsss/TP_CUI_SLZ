
angular.module('dueloLeyendasApp')
      .controller('LoginController',['$scope','$state','LoginService','LobbyService',function($scope,$state,LoginService,LobbyService){
  $scope.user = {usuario: "", password: ""};
  $scope.loginFailure=false;
  $scope.spanLog=""
  $scope.login = function (){
    LoginService.login($scope.user,$scope.callback,$scope.errorHandler);
  };
  $scope.callback = function(data){
    var nuevoUser = data.id;
    LobbyService.setUsr(nuevoUser);
    LobbyService.datosDelJuego($scope.callbackLobby,$scope.errorHandlerLobby)
    $state.go('lobby');
  };
  $scope.errorHandler=function(error){
    $scope.spanLog = error.descripcion
    $scope.loginFailure=true;
  };

  $scope.callbackLobby = function(data){
    alert("buenCallBack");
    LobbyService.setDatos(data);
  };
  $scope.errorHandlerLobby =function(error){
    alert("malCallback");
  };
}])
