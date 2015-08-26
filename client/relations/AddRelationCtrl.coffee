
class AddRelationCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		@$scope.addRelation = @addRelation

	addRelation: (person, process, ressource) =>
		@RelationsApp.addRelation(person, process, ressource)
			.then( 
					# ok
				(res) => (
					@$scope.person = ''
					@$scope.process = ''
					@$scope.ressource = ''
				)
					# error
				(err) => (
					console.log 'error adding relation: '+err					
				)
			)




angular.module('app').controller 'AddRelationCtrl', AddRelationCtrl
AddRelationCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']
