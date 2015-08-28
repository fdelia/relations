
class ProcessListCtrl
	constructor: (@$scope, @$meteor, @RelationsApp) ->
		$scope.timeSince = RelationsApp.timeSince

		# TODO transfer to service
		$scope.processes = Processes.find({}, {
			sort: {
				name: 1
			}
		}).fetch()


angular.module('app').controller 'ProcessListCtrl', ProcessListCtrl
ProcessListCtrl.$inject = ['$scope', '$meteor', 'RelationsApp']