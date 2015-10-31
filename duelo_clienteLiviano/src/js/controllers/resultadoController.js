angular.module('dueloLeyendasApp')
.controller('ResultController',['$scope','$state','ResultService',function($scope,$state,ResultService){

	$scope.informacionDelDuelo = ResultService.informacionDelDuelo();

	$scope.getImagePath = function(nombrePersonaje){
		return {'background-image':'url(css/images/Result/'+nombrePersonaje+'FullSize.jpg)'};
	};

	$scope.jugarConRobot = function(){
		ResultService.jugarConRobot();
	}
	$scope.irAlLobby = function(){
		$state.go('resultado');
	}
	$scope.goToLobby = function(){
		$state.go('lobby');
	}

}]);
