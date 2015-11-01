angular.module('dueloLeyendasApp')
      .controller('LobbyController',['$scope','$state','LobbyService','LoginService',function($scope,$state,LobbyService,LoginService){
  $scope.changeImgLobby = function (personaje){
    $scope.personajeSeleccionado = personaje;
  };
  $scope.personajesToTheHalf = function(leftOrRight){
    var res = [];
    var estadisticaPorPersonaje = $scope.datos.estadisticaPorPersonajes
    var middle = estadisticaPorPersonaje.length / 2;
    if(leftOrRight === 'left'){
      for(i = 0; i<middle; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        estadisticaPorPersonaje[i].personajeAsociado.imagenBigSrc = $scope.bigSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    else{
      for(i = middle; i<estadisticaPorPersonaje.length; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        estadisticaPorPersonaje[i].personajeAsociado.imagenBigSrc = $scope.bigSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    return res;

  };

  $scope.datos = LobbyService.getDatos();

  $scope.usuario = LobbyService.usuario;

  $scope.smallSrc = function(personaje){
    return "css/images/Lobby/" + personaje.nombre + ".png";
  };

  $scope.bigSrc = function(personaje){
    return "css/images/Lobby/" + personaje.nombre + "Big.jpg";
  };

  $scope.especialidad = true;

  $scope.jugar = function(){
    $scope.especialidad=false;
  }

  $scope.salir = function(){
    LobbyService.salir($scope.callback, $scope.errorHandler);
  };

  $scope.callback = function(data){
    alert(data.descripcion);
    $state.go('login');
  }

  $scope.errorHandler = function(error){
    alert(error.descripcion);
  }


}])
