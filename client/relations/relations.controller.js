/*
(function() {
	'use strict';

	var RelationsCtrl;
	angular.module('app').controller('RelationsCtrl', RelationsCtrl);
	RelationsCtrl.$inject = ['$scope', '$meteor'];

	function RelationsCtrl($scope, $meteor) {
		
		$scope.relations = getRelations();
				

		// TODO put into data service
		function getRelations(){
			// TODO add skip, limit
			var relations = Relations.find().fetch();

			var personIds = [], processIds = [], ressourceIds = [];
			relations.forEach(function(el){
				personIds.push(el.personId);
				processIds.push(el.processId);
				ressourceIds.push(el.ressourceId);				
			});


		}

	}

})();
*/
