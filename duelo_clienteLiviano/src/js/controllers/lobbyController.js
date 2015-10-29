angular.module('dueloLeyendasApp')
      .controller('LobbyController',['$scope','LobbyService','LoginService',function($scope,LobbyService,LoginService){
  $scope.changeImgLobby = function (personaje){
    document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje.nombre + "Big.jpg";
    document.getElementById("selectedCharacterlbl").textContent= personaje.nombre;
    $scope.personajeSeleccionado = personaje;
  };
  $scope.datosDelJuego = LobbyService.datosDelJuego();
  $scope.personajesToTheHalf = function(leftOrRight){
    var res = [];
    var personajes = $scope.datosDelJuego.personajes
    var middle = personajes.length / 2;
    if(leftOrRight === 'left'){
      for(i = 0; i<middle; i++){
        res.push(personajes[i]);
      }
    }
    else{
      for(i = middle; i<personajes.length; i++){
        res.push(personajes[i]);
      }
    }
    return res;

  };
  $scope.usuario = LoginService.usuario;

}])
