angular.module('dueloLeyendasApp')
      .controller('LobbyController',['$scope','LobbyService','LoginService',function($scope,LobbyService,LoginService){
  $scope.changeImgLobby = function (personaje){
    document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje.nombre + "Big.jpg";
    document.getElementById("selectedCharacterlbl").textContent= personaje.nombre;
    $scope.personajeSeleccionado = personaje;
  };
  $scope.personajesToTheHalf = function(leftOrRight){
    var res = [];
    var estadisticaPorPersonaje = LobbyService.getDatos().estadisticaPorPersonajes
    var middle = estadisticaPorPersonaje.length / 2;
    if(leftOrRight === 'left'){
      for(i = 0; i<middle; i++){
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    else{
      for(i = middle; i<estadisticaPorPersonaje.length; i++){
        res.push(estadisticaPorPersonaje[i].personajeAsociado);
      }
    }
    return res;

  };


}])
