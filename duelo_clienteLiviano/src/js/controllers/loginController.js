
angular.module('dueloLeyendasApp')
      .controller('LoginController',['$scope','$state','LoginService','LobbyService',function($scope,$state,LoginService,LobbyService){
  $scope.user = {usuario: "", password: ""};
  $scope.loginFailure=false;
  $scope.login = function (){
    LoginService.login($scope.user,$scope.callback,$scope.errorHandler);
  };
  $scope.callback = function(data){
    alert(data.id);
  };
  $scope.errorHandler=function(error){
    alert(error.descripcion);
    $scope.loginFailure=true;
  };
}])
