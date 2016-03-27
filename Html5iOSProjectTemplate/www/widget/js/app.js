angular.module('todayExtension', ['ionic', 'todayExtension.controllers', 'todayExtension.services'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('charts',{
        url: '/charts',
        templateUrl:'Widget/templates/charts.html',
        controller: 'ChartsCtrl',
    })
  $urlRouterProvider.otherwise('/charts');
});
