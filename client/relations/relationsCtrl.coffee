#
# First look at coffeescript for myself!
#

class RelationsCtrl
	constructor: (@$scope, @$meteor) ->
		# TODO put this into a data service
		# fat arrow so that this (the class-this) is given over to the anonymous functions
		# and @getRelations is the one defined in the class
		$meteor.subscribe('Relations').then () =>
			$meteor.subscribe('Persons').then () =>
				$meteor.subscribe('Processes').then () =>
					$meteor.subscribe('Ressources').then () =>
						# console.log 'subscribed all'
						# console.log Relations.find().fetch()
						@getRelations()

	
	# TODO also into data service
	getRelations: () ->
		@$scope.relations = ['asd', '333']
		relations = Relations.find().fetch()

		rel2 = for relation in relations do (relation) ->
			relation.person = Persons.find({_id: relation.personId})
			# relation.


	addRelation: (person, process, ressource) ->
		


angular.module('app').controller 'RelationsCtrl', RelationsCtrl
RelationsCtrl.$inject = ['$scope', '$meteor']