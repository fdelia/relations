
class PersonListCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		$scope.timeSince = RelationsApp.timeSince

		$scope.deleteElement = (type, id) =>
			RelationsApp.deleteElement(type, id)
				.then( 
						# ok
					(res) => (
						loadPersons()
					)
						# error
					(err) => (
						console.error(err)
					)
				)




		# TODO transfer to service
		loadPersons = () =>
			@$scope.persons = Persons.find({}, {
				sort: {
					name: 1
				}
			}).fetch()

		loadPersons()

angular.module('app').controller 'PersonListCtrl', PersonListCtrl
PersonListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']