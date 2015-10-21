angular.module('LobbyApp');
.controller('ResultController',function($scope,AllChampionsService){
	
	$scope.informacionDelDuelo = AllChampionsService.informacionDelDuelo()

})