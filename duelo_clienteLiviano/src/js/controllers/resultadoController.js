angular.module('dueloLeyendasApp')
.controller('ResultController',['$scope','$state','ResultService','LobbyService',function($scope,$state,ResultService,LobbyService){

	$scope.informacionDelDuelo = ResultService.getData();

	$scope.datos = {};

	$scope.setData = function(data) {
		ResultService.setData(data);
	};

	$scope.getImagePath = function(nombrePersonaje){
		return {'background-image':'url(css/images/Result/'+nombrePersonaje+'FullSize.jpg)'};
	};

	$scope.jugarConRobot = function(){
    	ResultService.informacionDelDueloBot($scope.callbackNoRival,$scope.errorHandlerNoRival);
	};

	$scope.callbackNoRival = function(data) {
	  ResultService.setData(data);
	  $state.go('result');
	};

	$scope.errorHandlerNoRival = function(error) {
	  alert(error.descripcion);
	  $state.go('noTienesRival');
	};

	$scope.callbackLobby = function(data){
    LobbyService.setDatos(data);
    $state.go('lobby');
  };
  $scope.errorHandlerLobby =function(error){
    alert(error.descripcion);
  };

	$scope.irAlLobby = function(){
		LobbyService.datosDelJuego($scope.callbackLobby,$scope.errorHandlerLobby);
	};

	$scope.colorVeredicto = {
		'color': 'red',
		'font-size': '26px',
		'text-align': 'center !important',
	};

	$scope.colorFondo ={
	  'background-color': '#ffb6c1'
	};

	$scope.colorearResultado = function(){
		if($scope.informacionDelDuelo.resultadoDuelo.veredicto.indexOf("ganaste") > -1){
			$scope.colorVeredicto= {
			  'color': 'green',
				'font-size': '26px',
			  'text-align': 'center !important',
			};
			$scope.colorFondo= {
			  'background-color': 'lightgreen'
			};
		}
	}

}]);
