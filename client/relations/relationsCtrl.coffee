#
# First look at coffeescript for myself!
#

# TODO make two ctrls, one for showing and one for adding relations
# one box = one controller


class RelationsCtrl
	constructor: (@$scope, @$meteor) ->
		@$scope.addRelation = @addRelation

		@$scope.relations = @getRelations()

		# set observers
		observerCallback = (id, obj) =>
			if ! initialization
				@$scope.relations = @getRelations()

		initialization = true
		Relations.find().observeChanges({
			added: observerCallback
		})
		initialization = false


	
		

	
	# TODO also into data service
	getRelations: () ->
		relations = Relations.find({}, {
			sort: {
				createdAt: -1
			}
		}).fetch()
		
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
				# TODO observe Relations, not here (DB may loads slow)
				# @$scope.relations = @getRelations()
				@$scope.$apply()


angular.module('app').controller 'RelationsCtrl', RelationsCtrl
RelationsCtrl.$inject = ['$scope', '$meteor']