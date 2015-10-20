angular
  .module('LobbyApp', [])
  .controller('LobbyController',function($scope){
    $scope.changeImgLobby = function (personaje){
      document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje + "Big.jpg";
    }
  })
