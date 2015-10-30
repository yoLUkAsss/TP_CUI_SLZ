angular.module('dueloLeyendasApp', ["ui.router"])

.config(function config($stateProvider){
  $stateProvider.state("login",{
    url: "",
    controller: "LoginController",
    templateUrl: "./templates/loginTemp.html"
  });
  $stateProvider.state("noTienesRival",{
    url: "/noRival",
    controller: "ResultController",
    templateUrl: "./templates/noTienesRivalTemp.html"
  });
  $stateProvider.state("resultado",{
    url: "/result",
    controller: "ResultController",
    templateUrl: "./templates/resultTemp.html"
  });
  $stateProvider.state("lobby",{
    url: "lobby",
    controller: "LobbyController",
    templateUrl: "./templates/lobbyTemp.html"
  });

})
