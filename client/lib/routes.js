(function() {
  'use strict';

  angular.module('app').config(['$urlRouterProvider', '$stateProvider',
    function($urlRouterProvider, $stateProvider) {

      $stateProvider
        .state('relations', {
          url: '/',
          templateUrl: 'client/relations/relations.ng.html',
          controller: 'RelationsCtrl'
        });
      //   .state('post', {
      //     url: '/post/:id',
      //     templateUrl: 'client/Stream/posts.ng.html',
      //     controller: 'StreamCtrl'
      //   })
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