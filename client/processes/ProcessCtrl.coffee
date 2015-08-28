
class ProcessCtrl
	constructor: (@$scope, @RelationsApp, @$stateParams) ->
		@$scope.timeSince = RelationsApp.timeSince
		@$scope.process = Processes.findOne({name: @$stateParams.id})
		if ! @$scope.process
			console.error 'process not found'


angular.module('app').controller 'ProcessCtrl', ProcessCtrl
ProcessCtrl.$inject = ['$scope', 'RelationsApp', '$stateParams']