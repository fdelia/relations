
class PersonListCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		@$scope.timeSince = RelationsApp.timeSince

		# TODO transfer to service
		@$scope.persons = Persons.find({}, {
			sort: {
				name: 1
			}
		}).fetch()


angular.module('app').controller 'PersonListCtrl', PersonListCtrl
PersonListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']