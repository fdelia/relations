
class RessourceListCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		$scope.timeSince = RelationsApp.timeSince

		$scope.deleteElement = (type, id) =>
			RelationsApp.deleteElement(type, id)
				.then( 
						# ok
					(res) => (
						loadRessources()
					)
						# error
					(err) => (
						console.error(err)
					)
				)




		# TODO transfer to service
		loadRessources = () =>
			$scope.ressources = Ressources.find({}, {
				sort: {
					name: 1
				}
			}).fetch()

		loadRessources()


angular.module('app').controller 'RessourceListCtrl', RessourceListCtrl
RessourceListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']