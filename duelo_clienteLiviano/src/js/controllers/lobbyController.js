angular.module('dueloLeyendasApp')
      .controller('LobbyController',['$scope','$state','LobbyService','LoginService','ResultService',function($scope,$state,LobbyService,LoginService,ResultService){

  $scope.datos = LobbyService.getDatos();
  $scope.personajeSeleccionado = $scope.datos.estadisticaPorPersonajes[0].personajeAsociado;
  $scope.estadisticaSeleccionada = $scope.datos.estadisticaPorPersonajes[0];
  $scope.usuario = LobbyService.usuario;

  $scope.changeEstadisticaSelecionada = function (estadistica){
    $scope.estadisticaSeleccionada = estadistica;
    $scope.personajeSeleccionado = estadistica.personajeAsociado;
  };
  $scope.personajesToTheHalf = function(leftOrRight){
    var res = [];
    var estadisticaPorPersonaje = $scope.datos.estadisticaPorPersonajes;
    var middle = estadisticaPorPersonaje.length / 2;
    if(leftOrRight === 'left'){
      for(i = 0; i<middle; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        estadisticaPorPersonaje[i].personajeAsociado.imagenBigSrc = $scope.bigSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i]);
      }
    }
    else{
      for(i = middle; i<estadisticaPorPersonaje.length; i++){
        estadisticaPorPersonaje[i].personajeAsociado.imagenSrc = $scope.smallSrc(estadisticaPorPersonaje[i].personajeAsociado);
        estadisticaPorPersonaje[i].personajeAsociado.imagenBigSrc = $scope.bigSrc(estadisticaPorPersonaje[i].personajeAsociado);
        res.push(estadisticaPorPersonaje[i]);
      }
    }
    return res;

  };

  $scope.ponerColorFondo = function(){
    return {'background-color':'red'}
  }


  $scope.smallSrc = function(personaje){
    return "css/images/Lobby/" + personaje.nombre + ".png";
  };

  $scope.bigSrc = function(personaje){
    return "css/images/Lobby/" + personaje.nombre + "Medium.jpg";
  };

  $scope.especialidad = true;

  $scope.salir = function(){
    LobbyService.salir($scope.callback, $scope.errorHandler);
  };

  $scope.callback = function(data){
    alert(data.descripcion);
    $state.go('login');
  };

  $scope.errorHandler = function(error){
    alert(error.descripcion);
  };


  /* RESPECTO AL ResultService*/

  $scope.jugar = function(posicion){
    var datos = {
      idJugador: $scope.usuario.nombre,
      idPersonajeJugador: $scope.personajeSeleccionado.nombre,
      posicionJugador: posicion
    };
    ResultService.guardarEleccionJugador(datos);
    ResultService.informacionDelDuelo($scope.callbackResult,$scope.errorHandlerResult);
  };

  $scope.callbackResult = function(data) {
    ResultService.setData(data);
    $state.go('result');
  };

  $scope.errorHandlerResult = function(error) {
    alert(error.descripcion);
    $state.go('noTienesRival');
  };



}])
