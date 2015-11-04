angular.module('dueloLeyendasApp')
.controller('ResultController',['$scope','$state','ResultService',function($scope,$state,ResultService){

	$scope.informacionDelDuelo = ResultService.getData();

	$scope.datos = {};

	$scope.setData = function(data) {
		ResultService.setData(data);
	};

	$scope.getImagePath = function(nombrePersonaje){
		return {'background-image':'url(css/images/Result/'+nombrePersonaje+'FullSize.jpg)'};
	};

	$scope.jugarConRobot = function(){
    	ResultService.informacionDelDueloBot($scope.datos,$scope.callbackNoRival,$scope.errorHandlerNoRival);
	};

	$scope.callbackNoRival = function(data) {
	  alert("OK");
	  ResultService.setData(data);
	  $state.go('result');
	};

	$scope.errorHandlerNoRival = function(error) {
	  alert(error.descripcion);
	  $state.go('noTienesRival');
	};

	$scope.irAlLobby = function(){
		$state.go('lobby');
	};

}]);
