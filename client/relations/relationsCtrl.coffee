#
# First look at coffeescript for myself!
#

# TODO make an two ctrls, one for showing and one for adding relations


class RelationsCtrl
	constructor: (@$scope, @$meteor) ->
		@$scope.addRelation = @addRelation

		# TODO put this into a data service or resolve (route.js)
		# fat arrow so that this (the class-this) is given over to the anonymous functions
		# and @getRelations is the one defined in the class
		$meteor.subscribe('Relations').then () =>
			$meteor.subscribe('Persons').then () =>
				$meteor.subscribe('Processes').then () =>
					$meteor.subscribe('Ressources').then () =>
						# console.log 'subscribed all'
						# console.log Relations.find().fetch()
						@$scope.relations = @getRelations()

	
	# TODO also into data service
	getRelations: () ->
		relations = Relations.find().fetch()
		
		relations = relations.filter (relation) ->
			relation.person = Persons.findOne({_id: relation.personId})
			relation.process = Processes.findOne({_id: relation.processId})
			relation.ressource = Ressources.findOne({_id: relation.ressourceId})

			# if one of these is not set, don't include it in the returned array
			relation.person and relation.process and relation.ressource

		relations
		

	addRelation: (person, process, ressource) =>
		if !person or !process or !ressource
			# TODO error handling for user
			console.error 'missing input'
			return

		Meteor.call 'addRelation', person, process, ressource, (err, res) =>
			if err
				console.error 'error adding new relation: '+err
			else
				# reset inputs and apply new data
				@$scope.person = ''
				@$scope.process = ''
				@$scope.ressource = ''
				@$scope.relations = @getRelations()
				@$scope.$apply()


angular.module('app').controller 'RelationsCtrl', RelationsCtrl
RelationsCtrl.$inject = ['$scope', '$meteor']