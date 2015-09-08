
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



angular.module('app').controller 'RelationListCtrl', RelationListCtrl
RelationListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']
