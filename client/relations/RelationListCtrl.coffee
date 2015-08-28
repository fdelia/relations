
class RelationListCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		$scope.timeSince = RelationsApp.timeSince
		$scope.relations = RelationsApp.getRelations()

		$scope.deleteElement = (type, id) =>
			RelationsApp.deleteElement(type, id)
				.then( 
						# ok
					(res) => (
						@$scope.relations = RelationsApp.getRelations()
					)
						# error
					(err) => (
						console.error(err)
					)
				)



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
	

angular.module('app').controller 'RelationListCtrl', RelationListCtrl
RelationListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']
