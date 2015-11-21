angular.module('starter.controllers', [])

.controller('NotificationsCtrl', function($scope) {
	$scope.scheduleNotifications = function() {
   		window.location="setNotifications";
  	}
  	$scope.cancelAllNotifications = function() {
  		window.location="cancelAllNotifications";
  	}
  	$scope.printNotifications = function() {
  		window.location="printNotificationsToConsole";
  	}
})
.controller('ChartsCtrl', function($scope){

})
.controller('HtmlContentCtrl', function($scope, Friends) {
  $scope.friends = Friends.all();
});
