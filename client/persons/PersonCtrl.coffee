
class PersonCtrl
	constructor: (@$scope, @$meteor, @$stateParams) ->
		@$scope.person = Persons.findOne({name: @$stateParams.id})
		if ! @$scope.person
			console.error 'person not found'


angular.module('app').controller 'PersonCtrl', PersonCtrl
PersonCtrl.$inject = ['$scope', '$meteor', '$stateParams']