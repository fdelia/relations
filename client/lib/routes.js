(function() {
  'use strict';

  angular.module('app').config(['$urlRouterProvider', '$stateProvider',
    function($urlRouterProvider, $stateProvider) {

      $stateProvider
        .state('relations', {
          url: '/',
          templateUrl: 'client/relations/relations.ng.html',
          controller: 'RelationsCtrl',
          resolve: {
            promiseObj: ['$meteor', '$q', function($meteor, $q) {
              var def = $q.defer();

              // TODO put this into a data service
              $meteor.subscribe('Relations').then(function() {
                $meteor.subscribe('Persons').then(function() {
                  $meteor.subscribe('Processes').then(function() {
                    $meteor.subscribe('Ressources').then(function() {
                      def.resolve('ok');
                    });
                  });
                });
              });

              return def.promise;
            }]
          }
        })
        .state('person', {
          url: '/person/:id',
          templateUrl: 'client/persons/persons.ng.html',
          controller: 'PersonCtrl'
        });
      //   .state('notifications', {
      //     url: '/notifications',
      //     templateUrl: 'client/Notifications/notifications.ng.html',
      //     controller: 'NotiCtrl',
      //     resolve: {
      //       'currentUser': ['$meteor', function($meteor) {
      //         return $meteor.requireUser();
      //       }]
      //     }
      //   });

      $urlRouterProvider.otherwise('/');
    }
  ]);

  angular.module("app").run(["$rootScope", "$state", function($rootScope, $state) {
    // $rootScope.$on("$stateChangeError", function(event, toState, toParams, fromState, fromParams, error) {
    // We can catch the error thrown when the $requireUser promise is rejected
    // and redirect the user back to the main page
    // if (error === "AUTH_REQUIRED") {
    //   alert('please login');
    //   $state.go('stream');
    // }
    // });
  }]);

})();