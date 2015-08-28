
class PersonCtrl
	constructor: (@$scope, @RelationsApp, @$stateParams) ->
		@$scope.timeSince = RelationsApp.timeSince
		@$scope.person = Persons.findOne({name: @$stateParams.id})
		if ! @$scope.person
			console.error 'person not found'


angular.module('app').controller 'PersonCtrl', PersonCtrl
PersonCtrl.$inject = ['$scope', 'RelationsApp', '$stateParams']