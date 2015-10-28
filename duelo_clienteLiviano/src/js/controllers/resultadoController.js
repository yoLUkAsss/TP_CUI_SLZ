angular.module('dueloLeyendasApp')
.controller('ResultController',function($scope,AllChampionsService){
	
	$scope.informacionDelDuelo = AllChampionsService.informacionDelDuelo();
	$scope.getImagePath = function(path){
		return {'background':'url(' + path +')'};
	};

});