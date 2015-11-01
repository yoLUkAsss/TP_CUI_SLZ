angular.module('dueloLeyendasApp')
      .controller('LobbyController',['$scope','LobbyService','LoginService',function($scope,LobbyService,LoginService){
  $scope.changeImgLobby = function (personaje){
    document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje.nombre + "Big.jpg";
    document.getElementById("selectedCharacterlbl").textContent= personaje.nombre;
    $scope.personajeSeleccionado = personaje;
  };
  $scope.personajesToTheHalf = function(leftOrRight){
    var res = [];
    var estadisticaPorPersonaje = $scope.datos.estadisticaPorPersonajes
    var middle = estadisticaPorPersonaje.length / 2;
    if(leftOrRight === 'left'){
      for(i = 0; i<middle; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    else{
      for(i = middle; i<estadisticaPorPersonaje.length; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    return res;

  };

  $scope.datos = LobbyService.getDatos();

  $scope.smallSrc = function(personaje){
    return "css/images/Lobby/" + personaje.nombre + ".png";
  }

  $scope.usuario = LobbyService.usuario;


}])
