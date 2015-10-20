var moduleL = angular.module('LobbyApp');
moduleL.controller('LobbyController',function($scope){
  $scope.changeImgLobby = function (personaje){
    document.getElementById("selectedCharacter").src = "css/images/Lobby/" + personaje + "Big.jpg";
  };
  $scope.personajes = function(){
    return serviceAllChamps.allChamps();
  }
})
