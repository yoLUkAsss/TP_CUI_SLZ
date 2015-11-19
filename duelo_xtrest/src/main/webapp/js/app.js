angular.module('dueloLeyendasApp', ["ui.router"])

.config(function config($stateProvider){
  $stateProvider.state("login",{
    url: "",
    controller: "LoginController",
    templateUrl: "./templates/loginTemp.html"
  });
  $stateProvider.state("noTienesRival",{
    url: "",
    controller: "ResultController",
    templateUrl: "./templates/noTienesRivalTemp.html"
  });
  $stateProvider.state("result",{
    url: "",
    controller: "ResultController",
    templateUrl: "./templates/resultTemp.html"
  });
  $stateProvider.state("lobby",{
    url: "",
    controller: "LobbyController",
    templateUrl: "./templates/lobbyTemp.html"
  });

})
