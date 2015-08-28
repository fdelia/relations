
class RessourceCtrl
	constructor: (@$scope, @RelationsApp, @$stateParams) ->
		@$scope.timeSince = RelationsApp.timeSince
		@$scope.ressource = Ressources.findOne({name: @$stateParams.id})
		if ! @$scope.ressource
			console.error 'ressource not found'


angular.module('app').controller 'RessourceCtrl', RessourceCtrl
RessourceCtrl.$inject = ['$scope', 'RelationsApp', '$stateParams']