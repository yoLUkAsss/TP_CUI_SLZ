angular.module('dueloLeyendasApp')
.controller('ResultController',function($scope,AllChampionsService){
	
	$scope.informacionDelDuelo = AllChampionsService.informacionDelDuelo()

})