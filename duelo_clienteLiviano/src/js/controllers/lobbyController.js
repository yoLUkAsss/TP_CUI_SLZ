angular.module('dueloLeyendasApp')
      .controller('LobbyController',function($scope,AllChampionsService){
  $scope.changeImgLobby = function (personaje){
    document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje + "Big.jpg";
    document.getElementById("selectedCharacterlbl").textContent= personaje;
  };
  $scope.datosDelJuego = AllChampionsService.datosDelJuego();
})
